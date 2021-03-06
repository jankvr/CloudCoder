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

import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.HTML;

import org.cloudcoder.app.shared.model.*;
/**
 * Dialog for deleting an existing user.
 * 
 * @author Jan Kovar
 *
 */
public class DeleteUserDialog extends DialogBox {
	private DeleteUserView deleteUserView;
	private Button deleteUserButton;
	private Button cancelButton;
	private ICallback<EditedUser> deleteUserCallback;
	private static HTML CONFIRMATION_MESSAGE = new HTML("Are you sure you want to delete this user?");
	
	public DeleteUserDialog(User user, boolean userIsInstructor, int sectionNum, boolean verifyCurrentPassword) {
		setGlassEnabled(true); // semitransparent pane
		
		this.deleteUserView = new DeleteUserView(verifyCurrentPassword);
		this.deleteUserView.populateUser(user, sectionNum, userIsInstructor);
		FlowPanel panel = new FlowPanel();
		FlowPanel buttonPanel = new FlowPanel();
		panel.add(CONFIRMATION_MESSAGE);
		panel.add(deleteUserView);
		
		this.deleteUserButton = new Button("Delete User");
		this.deleteUserButton.setStyleName("cc-floatRightButton", true);
		this.deleteUserButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				deleteUserCallback.call(deleteUserView.getData());
				
			}
		});
		
		this.cancelButton = new Button("Cancel");
		this.cancelButton.setStyleName("cc-floatLeftButton", true);
		this.cancelButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				hide();
				
			}
			
		});
		
		buttonPanel.add(deleteUserButton);
		buttonPanel.add(cancelButton);
		
		panel.add(buttonPanel);
		
		add(panel);
		
	}
	
	public void setDeleteUserCallback(ICallback<EditedUser> deleteUserCallback) {
		this.deleteUserCallback = deleteUserCallback;
		
	}
}
