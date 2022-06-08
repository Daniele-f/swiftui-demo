	//
	//  ContentView.swift
	//  Demo
	//
	//  Created by Administrator on 27/05/2022.
	//

import SwiftUI

struct ContentView: View {
		// MARK: - Properties
	@State private var selection = 1
	
		// MARK: - Body
	var body: some View {
		TabView(selection: $selection) {
			ScannerView()
				.tabItem {
					Label("Scanner", systemImage: "qrcode.viewfinder")
				}
				.tag(1)
				.onAppear() {
					self.selection = 1
				}
			
			BluetoothView()
				.tabItem {
					Label("Bluetooth", systemImage: "antenna.radiowaves.left.and.right")
				}
				.tag(2)
				.onAppear() {
					self.selection = 2
				}
			
			ListDataView()
				.tabItem {
					Label("ListData", systemImage: "list.bullet")
				}
				.tag(3)
				.onAppear() {
					self.selection = 3
				}
			
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gear")
				}
				.tag(4)
				.onAppear() {
					self.selection = 4
				}
			
			DataView()
				.tabItem {
					Label("Data", systemImage: "folder")
				}
				.tag(5)
				.onAppear() {
					self.selection = 5
				}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
