// CloudCoder - a web-based pedagogical programming environment
// Copyright (C) 2011-2014, Jaime Spacco <jspacco@knox.edu>
// Copyright (C) 2011-2014, David H. Hovemeyer <david.hovemeyer@gmail.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

package org.cloudcoder.app.server.login;

import javax.servlet.http.HttpServletRequest;

import org.cloudcoder.app.server.persist.LdapBase;
import org.cloudcoder.app.shared.model.User;

/**
 * @author Jan Kovar
 *
 */
public class LdapLoginProvider extends AbstractLoginProvider {

	@Override
	public User login(String username, String password, HttpServletRequest request) {
		// Create new instance of ldap base (caused by neccesity of unique DirContext)
		LdapBase ldapBase = new LdapBase();
		
		User user = ldapBase.getUserEntity(username, password);
		return user;
	}

	
}
