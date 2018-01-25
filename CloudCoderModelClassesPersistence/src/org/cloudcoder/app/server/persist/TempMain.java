package org.cloudcoder.app.server.persist;

import org.cloudcoder.app.shared.model.User;

public class TempMain {
	
	public static void main(String[] args) {
		LdapBase base = new LdapBase(true);
		
		User user = base.getUserEntity("xkovj41", "");
		
		System.out.println(user.getId());
	}
}
