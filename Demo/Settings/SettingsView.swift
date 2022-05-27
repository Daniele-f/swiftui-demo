//
//  SettingsView.swift
//  Demo
//
//  Created by Administrator on 27/05/2022.
//

import SwiftUI

struct SettingsView: View {
		// MARK: - Properties
	let listTypes: [String] = ["Option 1", "Option 2", "Option 3"]
	
	@State private var selectedType: String = ""
	@State private var selectedDate: Date = Date()
	@State private var text: String = ""
	@State private var showMoreSettings: Bool = false
	@State var isToggled: Bool = false
	@State var getSliderValue: Double = 0.0
	
	@State private var showAlert = false
	
		// MARK: - Body
	var body: some View {
		NavigationView {
			List {
				Section {
					Picker("Option:", selection: $selectedType) {
						ForEach(listTypes, id: \.self) {
							Text($0)
						}
					} // Picker
					.onAppear {
						selectedType = listTypes[0]
					}
					
					HStack {
						Text("Option:")
						Spacer()
						Picker("Option:", selection: $selectedType) {
							ForEach(listTypes, id: \.self) {
								Text($0)
							}
						}
						.pickerStyle(.segmented)
						.onAppear {
							selectedType = listTypes[0]
						}
					} // HStack
					DatePicker("Date:", selection: $selectedDate, in: Date()..., displayedComponents: .date)
						.datePickerStyle(.compact)
					HStack {
						Text("Text:")
						TextField("Text", text: $text)
							.textFieldStyle(RoundedBorderTextFieldStyle())
					} // HStack
					Button("Save") {
						showAlert = true
					}.alert(Text("Settings"), isPresented: $showAlert) {
						Button("Option: \(selectedType)") {}
						Button("Date: \(selectedDate)") {}
						Button("Text: \(text)") {}
						Button("Toggle: \(String(isToggled))") {}
						Button("Slider: \(getSliderValue)") {}
					}
					.padding(10)
					.buttonStyle(.borderedProminent)
					.frame(maxWidth: .infinity)
					
					
				} // Section
				  //				.listRowSeparator(.hidden)  // Removes separators between list items
			} // List
			.listStyle(InsetGroupedListStyle())
			.navigationTitle("Settings")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) { // Optional
					Button {
						self.showMoreSettings.toggle()
					} label: {
						Label("More", systemImage: "ellipsis")
					}
					.sheet(isPresented: $showMoreSettings) {
						MoreSettingsView(showMoreSettings: self.$showMoreSettings, enableToggle: $isToggled, sliderValue: $getSliderValue)
					}
				}
			}
		} // NavigationView
		
	}
		// MARK: - Functions
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
