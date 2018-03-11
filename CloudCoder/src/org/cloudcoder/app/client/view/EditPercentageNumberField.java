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

import org.cloudcoder.app.shared.model.ModelObjectField;

import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.IntegerBox;
import com.google.gwt.user.client.ui.IsWidget;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.TextBox;

/**
 * @author jankvr
 *
 */
public class EditPercentageNumberField<ModelObjectType>
	extends EditModelObjectField<ModelObjectType, Integer>{

	private class UI extends EditModelObjectFieldUI {
		private IntegerBox integerBox;

		public UI() {
			FlowPanel panel = new FlowPanel();
			
			panel.setStyleName("cc-editStringField");
			panel.setStyleName("cc-fieldEditor", true);
			
			Label label = new Label(getDescription());
			label.setStyleName("cc-fieldEditorLabel", true);
			panel.add(label);
			
			panel.add(getErrorLabel());
			
			integerBox = new IntegerBox();
			integerBox.setWidth("300px");
			panel.add(integerBox);
			
			initWidget(panel);
		}
		
		public void setValue(int value) {
			integerBox.setValue(value);
		}
		
		public int getValue() {
			return integerBox.getValue();
		}
	}

	private UI ui;
	
	/**
	 * @param desc
	 * @param field
	 */
	public EditPercentageNumberField(String desc, ModelObjectField<? super ModelObjectType, Integer> field) {
		super(desc, field);
		ui = new UI();
	}

	@Override
	public IsWidget getUI() {
		// TODO Auto-generated method stub
		return ui;
	}

	@Override
	public void commit() {
		int value = ui.getValue();
		if (value > 100 || value < 0) {
			setCommitError(true);
			ui.setError("Value must be bigger than (or equal to) 0 and lesser than  (or equal to) 100.");
		} else {
			setCommitError(false);
			ui.clearError();
			setField(value);
		}
	}

	@Override
	public void update() {
		ui.setValue(getField());
		
	}

}
