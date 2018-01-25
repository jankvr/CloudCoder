package org.cloudcoder.app.server.persist;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

import org.cloudcoder.app.shared.model.User;

public class LdapContext {

	private InitialDirContext context;

	/**
	 * This method is made for retrieving specific context, which is used to
	 * obtaining additional information about user
	 * 
	 * @param principal
	 *            principal nameFirstClass
	 * @param credentials
	 *            password
	 * @param origin
	 *            specifies which organization unit should be searched in
	 * @return specific context
	 */
	public InitialDirContext getDirContext(String principal, String credentials, String origin) {
		Hashtable<String, String> env = new Hashtable<String, String>();
		
		env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		env.put(Context.PROVIDER_URL, PropertiesResolver.getInstance().getLdapAddress());
		
		boolean searchWithCredentials = credentials != null && !credentials.equals("");
		
		if (searchWithCredentials) {
			env.put(Context.SECURITY_PRINCIPAL, "cn=" + principal + "," + origin);
			env.put(Context.SECURITY_CREDENTIALS, credentials);		
			env.put(Context.SECURITY_AUTHENTICATION, "simple");
		}
		else {
			env.put(Context.SECURITY_AUTHENTICATION, "none");	
		}
		
		context = null;
		
		try {
			context = new InitialDirContext(env);
			
			// Kontrola, zda nalezl nejakyho uzivaka
			if (!searchWithCredentials) {
				SearchControls constraints = new SearchControls();
				constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);

				NamingEnumeration<SearchResult> answer = context.search(origin, "cn=" + principal, constraints);

				while (answer.hasMore()) {
					Attributes attrs = ((SearchResult) answer.next()).getAttributes();
					
					if (attrs == null) {
						return null;
					}
				}
			}
		} catch (Exception e) {
			return null;
		}
		
		return context;
		
	}
	
	public InitialDirContext getDirContext(String principal, String origin, Boolean isAuth) {
		if (isAuth) {
			return getDirContext(principal, null, origin);
		}
		
		return null;
	}
	
	/**
	 * Method closes the context instance.
	 * @throws NamingException
	 */
	public void closeContext() throws NamingException {
		this.context.close();
	}
}
