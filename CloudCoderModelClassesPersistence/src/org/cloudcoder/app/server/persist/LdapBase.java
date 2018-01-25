package org.cloudcoder.app.server.persist;

import javax.naming.NamingEnumeration;
import javax.naming.directory.Attributes;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

import org.cloudcoder.app.shared.model.User;

public class LdapBase {
	private LdapContext context;
	private boolean isAuth;

	public LdapBase() {
		this.context = new LdapContext();
		this.isAuth = false;
	}
	
	public LdapBase(boolean isAuth) {
		this.context = new LdapContext();
		this.isAuth = isAuth;
	}

	public User getUserEntity(String principal, String credentials) {
		InitialDirContext context = null;
		
		boolean isStudent = true;
		String base = PropertiesResolver.getInstance().getLdapStudentBase();

		// Search in student base.
		context = credentials == null || credentials == "" ?
					this.context.getDirContext(principal, PropertiesResolver.getInstance().getLdapStudentBase(), isAuth) :
					this.context.getDirContext(principal, credentials, PropertiesResolver.getInstance().getLdapStudentBase());
					

		if (context == null) {
			// If the context is still null, try to search in lector base.
			context = credentials == null || credentials == "" ?
						this.context.getDirContext(principal, PropertiesResolver.getInstance().getLdapLectorBase(), isAuth) :
						this.context.getDirContext(principal, credentials, PropertiesResolver.getInstance().getLdapLectorBase());
					

			// If context retrieval is unsuccessful, return null.
			if (context == null) {
				return null;
			}

			isStudent = false;
			base = PropertiesResolver.getInstance().getLdapLectorBase();
		}

		SearchControls constraints = new SearchControls();
		constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);

		try {
			NamingEnumeration<SearchResult> answer = context.search(base, "cn=" + principal, constraints);

			User user = null;

			while (answer.hasMore()) {
				Attributes attrs = ((SearchResult) answer.next()).getAttributes();
				
				user = parseUser(attrs, isStudent);
			}
			this.context.closeContext();
			return user;
		} catch (Exception e) {
			return null;
		}
	}
	
	private User parseUser(Attributes attrs, boolean studentFlag) {
		if (attrs == null) {
			return null;
		}
		
		User user = new User();
		
		String notParsedId = attrs.get("uid").toString().replaceAll("[^0-9]", "");
		int id = Integer.parseInt(notParsedId);
		
		user.setId(id);
		user.setUsername(attrs.get("cn").toString());
		user.setEmail(attrs.get("mail").toString());
		user.setSuperuser(!studentFlag);
		
		return user;
	}
}
