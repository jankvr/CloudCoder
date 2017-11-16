package org.cloudcoder.app.server.persist.txn;

import java.sql.Connection;
import java.sql.SQLException;

import org.cloudcoder.app.server.persist.util.AbstractDatabaseRunnableNoAuthException;
import org.cloudcoder.app.server.persist.util.ConfigurationUtil;
import org.cloudcoder.app.shared.model.CourseAndCourseRegistration;

public class DeleteCourse extends AbstractDatabaseRunnableNoAuthException<Boolean>{

	private final CourseAndCourseRegistration cc;
	
	public DeleteCourse(CourseAndCourseRegistration cc) {
		this.cc = cc;
	}
	
	@Override
	public String getDescription() {
		return "Deleting course record";
	}

	@Override
	public Boolean run(Connection conn) throws SQLException {
		getLogger().info("Deleting course " + cc.getCourse().getNameAndTitle());
		return ConfigurationUtil.deleteCourseById(conn, cc);
	}

	
}
