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

import org.cloudcoder.app.client.model.Session;
import org.cloudcoder.app.client.model.StatusMessage;
import org.cloudcoder.app.client.page.CloudCoderPage;
import org.cloudcoder.app.client.page.SessionObserver;
import org.cloudcoder.app.client.page.SessionUtil;
import org.cloudcoder.app.shared.model.Course;
import org.cloudcoder.app.shared.model.CourseAndCourseRegistration;
import org.cloudcoder.app.shared.model.CourseRegistrationList;
import org.cloudcoder.app.shared.model.CourseSelection;
import org.cloudcoder.app.shared.model.ICallback;
import org.cloudcoder.app.shared.util.SubscriptionRegistrar;

import com.google.gwt.dom.client.Style.Unit;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.LayoutPanel;
/**
 * @author jankvr
 *
 */


public class CoursesListPanel extends Composite implements CourseInstructorUI, SessionObserver, IRedisplayable {
	private enum CourseAdminAction implements IButtonPanelAction {
		DELETE("Delete", "Delete course");
		
		private String name;
		private String tooltip;
		
		private CourseAdminAction(String name, String tooltip) {
			this.name = name;
		}
		
		public String getName() {
			return name;
		}
		
		public boolean isEnabledByDefault() {
			return false;
		}
		
		@Override
		public String getTooltip() {
			return tooltip;
		}
	}

	private CloudCoderPage page;
	private CoursesListView view;
	private ButtonPanel<CourseAdminAction> buttonPanel;
	
	public CoursesListPanel(CloudCoderPage page) {		
		this.page = page;
		LayoutPanel panel = new LayoutPanel();
		
		panel.setWidth("100%");
		panel.setHeight("400px");
		
		this.buttonPanel = new ButtonPanel<CourseAdminAction>(CourseAdminAction.values()) {

			@Override
			public void onButtonClick(CourseAdminAction action) {
				switch(action) {
				case DELETE:
					handleDelete();
					break;
				default:
					break;
				}
				
			}

			@Override
			public boolean isEnabled(CourseAdminAction action) {
				CourseAndCourseRegistration selected = view.getSelectedCourse();
				return selected != null;
			}
			
		};

		buttonPanel.setStyleName("cc-inlineFlowPanel", true); 
		
		panel.add(buttonPanel);
		panel.setWidgetLeftRight(buttonPanel, 10.0, Unit.PX, 10.0, Unit.PX);
		panel.setWidgetTopHeight(buttonPanel, 0.0, Unit.PX, ButtonPanel.HEIGHT_PX, Unit.PX);

		view = new CoursesListView();
		
		panel.add(view);
		panel.setWidgetTopBottom(view, 44.0, Unit.PX, 20.0, Unit.PX);
		panel.setWidgetLeftRight(view, 10.0, Unit.PX, 10.0, Unit.PX);

		initWidget(panel);
	}
	
	@Override
	public void activate(Session session, SubscriptionRegistrar subscriptionRegistrar) {
		// Keep track of changes to instructor status
		new CourseInstructorStatusMonitor(this).activate(session, subscriptionRegistrar);

		view.activate(session, subscriptionRegistrar);
		buttonPanel.activate(session, subscriptionRegistrar);
	}

	@Override
	public void setEnabled(boolean bool) {
		buttonPanel.setEnabled(bool);
		view.setEnabled(bool);
	}

	@Override
	public void onCourseChange(Course course) {
		// Nothing specific to do
	}
	
	@Override
	public void redisplay() {
		view.redisplay();
	}
	
	private void handleDelete() {
		final CourseAndCourseRegistration cc = view.getSelectedCourse();
		
		CourseSelection courseSel = page.getSession().get(CourseSelection.class);
		
		if (cc == null || courseSel == null) {
			return;
		}
		
		final Course course = courseSel.getCourse();

		SessionUtil.getUserCourseRegistrations(page, cc, course, new ICallback<CourseRegistrationList>() {

			@Override
			public void call(CourseRegistrationList value) {
				// TODO Auto-generated method stub
				
			}
			
		};
		
		page.getSession().add(StatusMessage.error("Not implemented edit for " + cc.getCourse().getNameAndTitle()));
	}

}
