 package org.cloudcoder.app.shared.model;

import java.io.Serializable;

public class CourseListSelection implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Course course;
	private CourseAndCourseRegistration cc;
	
	public CourseListSelection() {}
	
	public CourseListSelection(Course course) {
		this.course = course;
	}
	
	public CourseListSelection(CourseAndCourseRegistration cc) {
		this.cc = cc;
	}
	
	/**
	 * Set the course.
	 * @param course the course to set
	 */
	public void setCourseAndCourseRegistration(CourseAndCourseRegistration cc) {
		this.cc = cc;
	}
	
	/**
	 * Get the course.
	 * @return the course
	 */
	public CourseAndCourseRegistration getCourseAndCourseRegistration() {
		return cc;
	}
	
	/**
	 * Set the course.
	 * @param course the course to set
	 */
	public void setCourse(Course course) {
		this.course = course;
	}
	
	/**
	 * Get the course.
	 * @return the course
	 */
	public Course getCourse() {
		return course;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof CourseSelection)) {
			return false;
		}
		CourseListSelection other = (CourseListSelection) obj;
		if (!this.cc.equals(other.getCourseAndCourseRegistration())) {
			return false;
		}
		return ModelObjectUtil.equals(this.cc, other.cc);
	}
	
	@Override
	public int hashCode() {
		return cc.getCourse().getId() * 997 + (course != null ? cc.getCourse().getId() : 0);
	}
	
}
