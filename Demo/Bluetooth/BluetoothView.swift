	//
	//  BluetoothView.swift
	//  Demo
	//
	//  Created by Administrator on 27/05/2022.
	//

import SwiftUI

struct BluetoothView: View {
	
	@ObservedObject var bleManager = BluetoothManager()
	
	var body: some View {
		VStack (spacing: 10) {
			
			Text("Bluetooth Devices")
				.font(.largeTitle)
				.frame(maxWidth: .infinity, alignment: .center)
				.padding(.top)
			
			List(bleManager.peripherals) { peripheral in
				HStack {
					Text(peripheral.name)
					Spacer()
					Text(String(peripheral.rssi))
				}
			}
//			.frame(height: 300)
			
			Spacer()
			
			Text("STATUS")
				.font(.headline)
			
				// Status goes here
			if bleManager.isSwitchedOn {
				Text("Bluetooth is switched on")
					.foregroundColor(.green)
			}
			else {
				Text("Bluetooth is NOT switched on")
					.foregroundColor(.red)
			}
			
			Spacer()
			
			HStack {
				VStack (spacing: 10) {
					Button(action: {
						self.bleManager.startScanning()
					}) {
						Text("Start Scanning")
					}
					Button(action: {
						self.bleManager.stopScanning()
						self.bleManager.clear()
					}) {
						Text("Stop Scanning")
					}
				}.padding()
				
//				Spacer()
//
//				VStack (spacing: 10) {
//					Button(action: {
//						print("Start Advertising")
//					}) {
//						Text("Start Advertising")
//					}
//					Button(action: {
//						print("Stop Advertising")
//					}) {
//						Text("Stop Advertising")
//					}
//				}.padding()
			}
			Spacer()
		}
	}
	
}
struct BluetoothView_Previews: PreviewProvider {
	static var previews: some View {
		BluetoothView()
	}
}
