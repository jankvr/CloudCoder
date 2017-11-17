package org.cloudcoder.app.server.persist;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.InitialDirContext;

public class LdapContext {

	private InitialDirContext context;

	/**
	 * This method is made for retrieving specific context, which is used to
	 * retrieve additional information about user
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
		
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.SECURITY_PRINCIPAL, "cn=" + principal + "," + origin);
		env.put(Context.SECURITY_CREDENTIALS, credentials);
		
		context = null;
		
		try {
			context = new InitialDirContext(env);
		} catch (Exception e) {
			return null;
		}
		
		return context;
		
	}
	
	/**
	 * Method closes the context instance.
	 * @throws NamingException
	 */
	public void closeContext() throws NamingException {
		this.context.close();
	}
}
