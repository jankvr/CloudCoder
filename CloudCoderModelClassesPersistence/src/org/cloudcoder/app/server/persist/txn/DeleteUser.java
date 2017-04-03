package org.cloudcoder.app.server.persist.txn;

import java.sql.Connection;
import java.sql.SQLException;

import org.cloudcoder.app.server.persist.util.AbstractDatabaseRunnableNoAuthException;
import org.cloudcoder.app.server.persist.util.ConfigurationUtil;
import org.cloudcoder.app.shared.model.User;

public class DeleteUser extends AbstractDatabaseRunnableNoAuthException<Boolean> {

	private final User user;
	
	public DeleteUser(User user) {
		this.user = user;
	}
	
	@Override
	public String getDescription() {
		return "Deleting user record";
	}

	@Override
	public Boolean run(Connection conn) throws SQLException {
		getLogger().info("Deleting user " + user.getId() + " " + user.getUsername());
		ConfigurationUtil.deleteUserById(conn, user);
		return true;
	}

}
