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

package org.cloudcoder.app.client.view;

import java.util.Arrays;

import org.cloudcoder.app.client.model.Session;
import org.cloudcoder.app.client.model.StatusMessage;
import org.cloudcoder.app.client.page.SessionObserver;
import org.cloudcoder.app.client.rpc.RPC;
import org.cloudcoder.app.shared.model.Course;
import org.cloudcoder.app.shared.model.CourseAndCourseRegistration;
import org.cloudcoder.app.shared.model.CourseSelection;
import org.cloudcoder.app.shared.util.Publisher;
import org.cloudcoder.app.shared.util.Subscriber;
import org.cloudcoder.app.shared.util.SubscriptionRegistrar;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.cellview.client.DataGrid;
import com.google.gwt.user.cellview.client.TextColumn;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.ResizeComposite;
import com.google.gwt.view.client.SelectionChangeEvent;
import com.google.gwt.view.client.SelectionChangeEvent.Handler;
import com.google.gwt.view.client.SingleSelectionModel;

/**
 * @author jankvr
 *
 */
public class CoursesListView extends ResizeComposite implements Subscriber, SessionObserver, IRedisplayable {

	private DataGrid<CourseAndCourseRegistration> grid;
	private Session session;
	private CourseAndCourseRegistration selected;
	
	public CoursesListView() { 
		
		grid = new DataGrid<CourseAndCourseRegistration>();
		grid.addColumn(new TextColumn<CourseAndCourseRegistration>() {

			@Override
			public String getValue(CourseAndCourseRegistration course) {
				return course.getCourse().getNameAndTitle();
			}
			
		}, "Course Name");
		
		grid.addColumn(new TextColumn<CourseAndCourseRegistration>() {
			
			@Override
			public String getValue(CourseAndCourseRegistration course) {
				return course.getCourse().getTermAndYear().toString();
			}
		}, "Term and year");
		
		initWidget(grid);
	}
	
	public CourseAndCourseRegistration getSelectedCourse() {
		return selected;
	}
	
	@Override
	public void redisplay() {
		CourseAndCourseRegistration[] courseList = session.get(CourseAndCourseRegistration[].class);
		if (courseList != null) {
			GWT.log("CourseListView redisplaying " + courseList.length + " courses");
			displayCourses(courseList);
		}
		
	}
	
	protected void displayCourses(CourseAndCourseRegistration[] result) {
		grid.setRowCount(result.length);
		grid.setRowData(Arrays.asList(result));
		grid.setVisibleRange(0, result.length);
	}

	@Override
	public void activate(final Session session, SubscriptionRegistrar subscriptionRegistrar) {
		this.session = session;
		this.session.subscribe(Session.Event.ADDED_OBJECT, this, subscriptionRegistrar);
		
		final SingleSelectionModel<CourseAndCourseRegistration> selectionModel = new SingleSelectionModel<CourseAndCourseRegistration>();
		selectionModel.addSelectionChangeHandler(new Handler() {

			@Override
			public void onSelectionChange(SelectionChangeEvent event) {
				selected = selectionModel.getSelectedObject();
				session.add(new CourseSelection(selected));
			}
			
		});
		
		grid.setSelectionModel(selectionModel);
		
		loadCourses();
	}

	@Override
	public void eventOccurred(Object key, Publisher publisher, Object hint) {
		if (key == Session.Event.ADDED_OBJECT && hint instanceof CourseSelection) {
			//page.getSession().add(StatusMessage.information("changed to " + selected.getNameAndTitle()));
			loadCourses();
		}
		
	}

	public void setEnabled(boolean b) {

	}
	
	public void loadCourses() {
		RPC.getCoursesAndProblemsService.getCourseAndCourseRegistrations(new AsyncCallback<CourseAndCourseRegistration[]>() {

			@Override
			public void onFailure(Throwable caught) {
				session.add(StatusMessage.error("Could not load courses"));
			}

			@Override
			public void onSuccess(CourseAndCourseRegistration[] result) {
				session.add(result);
				displayCourses(result);
			}
			
		});
	}
}
