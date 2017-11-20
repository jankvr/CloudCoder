package org.cloudcoder.app.server.persist;

import javax.naming.NamingEnumeration;
import javax.naming.directory.Attributes;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

import org.cloudcoder.app.shared.model.User;

public class LdapBase {
	private LdapContext context;

	public LdapBase() {
		this.context = new LdapContext();
	}

	public User getUserEntity(String principal, String credentials) {
		InitialDirContext context = null;
		
		boolean isStudent = true;
		String base = PropertiesResolver.getInstance().getLdapStudentBase();

		// Search in student base.
		context = this.context.getDirContext(principal, credentials, PropertiesResolver.getInstance().getLdapStudentBase());

		if (context == null) {
			// If the context is still null, try to search in lector base.
			context = this.context.getDirContext(principal, credentials, PropertiesResolver.getInstance().getLdapLectorBase());

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
				user = new User();

				Attributes attrs = ((SearchResult) answer.next()).getAttributes();
				
				String notParsedId = attrs.get("uid").toString().replaceAll("[^0-9]", "");
				int id = Integer.parseInt(notParsedId);
				
				user.setId(id);
				user.setUsername(attrs.get("cn").toString());
				user.setEmail(attrs.get("mail").toString());
				user.setSuperuser(!isStudent);
			}
			this.context.closeContext();
			return user;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
