//
//  MoreSettingsView.swift
//  Demo
//
//  Created by Administrator on 27/05/2022.
//

import SwiftUI

struct MoreSettingsView: View {
		// MARK: - Properties
	@Binding var showMoreSettings: Bool
	@Binding var enableToggle: Bool
	@Binding var sliderValue: Double
	
		// MARK: - Body
	var body: some View {
		List {
			Section(header: Text("More Settings")) {
				Toggle(isOn: $enableToggle) {
					Text("Toggle")
				}
				Slider(value: $sliderValue, in: -10...10)
				Text("\(sliderValue, specifier: "%.2f")")
				
			}
		} // List
		.listStyle(InsetGroupedListStyle())
		Button("Dismiss") {
			self.showMoreSettings.toggle()
		}
	}
}

struct MoreSettingsView_Previews: PreviewProvider {
	static var previews: some View {
		MoreSettingsView(showMoreSettings: .constant(true), enableToggle: .constant(true), sliderValue: .constant(0))
	}
}
