package org.cloudcoder.app.server.persist;

import java.io.IOException;
import java.util.Properties;

import org.cloudcoder.app.server.persist.util.DBUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Helper class for getting basic cloudcoder properties
 * @author Jan Kovar
 *
 */
public class PropertiesResolver {
	
	static final Logger logger = LoggerFactory.getLogger(PropertiesResolver.class);
	
	private static Properties config;

	private static PropertiesResolver instance;
	
	private static Object instanceLock = new Object();

	/**
	 * Private constructor
	 * @throws IOException 
	 */
	private PropertiesResolver() throws IOException {
		config = DBUtil.getConfigProperties();
	}
	
	/**
	 * @return the singleton instance of PropertiesResolver
	 */
	public static PropertiesResolver getInstance() {
		synchronized(instanceLock) {
			if (instance == null) {
				try {
					createInstance();
				} catch (IOException e) {
					logger.info(e.getMessage(), e);
				}
			}
			return instance;
		}
	}
	
	/**
	 * Method is creating instance
	 * @throws IOException
	 */
	public static void createInstance() throws IOException {
		synchronized (instanceLock) {
			if (instance != null) {
				throw new IllegalStateException("PropertiesResolver already exists");
			}
			instance = new PropertiesResolver();
		}
	}
	
	/**
	 * Destroy the singleton instance of PropertiesResolver.
	 */
	public static void destroy() {
		synchronized (instanceLock) {
			instance = null;
		}
	}
	
	/**
	 * Returning whether the app is using LDAP or not.
	 * @return true if so.
	 */
	public boolean getLdapIndication() {
		String usage = config.getProperty("cloudcoder.ldap.usage");
		
		return usage != null && usage.equals("yes");
	}
	
	/**
	 * Returning LDAP address.
	 * @return LDAP address
	 */
	public String getLdapAddress() {
		return config.getProperty("cloudcoder.ldap.address");
	}
	
	/**
	 * Returning student base.
	 * @return student base
	 */
	public String getLdapStudentBase() {
		return config.getProperty("cloudcoder.ldap.students");
	}
	
	/**
	 * Returning lector base.
	 * @return lector base
	 */
	public String getLdapLectorBase() {
		return config.getProperty("cloudcoder.ldap.lectors");
	}
}
