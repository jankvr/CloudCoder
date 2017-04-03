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

import java.util.ArrayList;
import java.util.List;

import org.cloudcoder.app.shared.model.CourseRegistrationType;
import org.cloudcoder.app.shared.model.EditedUser;
import org.cloudcoder.app.shared.model.User;

import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.PasswordTextBox;
import com.google.gwt.user.client.ui.TextBox;

/**
 * View for deleting an {@link EditedUser} object.
 * This view can be used for deleting one (or more users)
 * 
 * @author Jan Kovar
 *
 */
public class DeleteUserView extends Composite {

	private PasswordTextBox currentPassword;
	private static final String LABEL = "Enter your password";
	private List<TextBox> validateNonEmpty;
	private Label errorLabel;
	private EditedUser user;
	
	public DeleteUserView(boolean verifyCurrentPassword) {
		this.validateNonEmpty = new ArrayList<TextBox>();
		this.user = null;
		
		FlowPanel holder = new FlowPanel();
		
		if (verifyCurrentPassword) {
			currentPassword = addPasswordTextBox(holder, LABEL, verifyCurrentPassword);
			
		}
		
		this.errorLabel = new Label(" ");
		errorLabel.setStyleName("cc-errorText", true);
		holder.add(errorLabel);
		
		initWidget(holder);
	}
	
	private PasswordTextBox addPasswordTextBox(FlowPanel holder, String labelText, boolean required) {
		holder.add(new Label(labelText));
		
		PasswordTextBox textBox = new PasswordTextBox();
		holder.add(textBox);
		
		if (required) {
			validateNonEmpty.add(textBox);
		}
		return textBox;	
	}
	
	public void populateUser(User user, int sectionNum, boolean isInstructor) {
		this.user = new EditedUser();
		this.user.setUser(user);
		this.user.setSection(sectionNum);
	}
	
	public EditedUser getData() {
		return user;
	}
}
