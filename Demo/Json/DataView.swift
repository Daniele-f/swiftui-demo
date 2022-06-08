	//
	//  DataView.swift
	//  Demo
	//
	//  Created by Administrator on 03/06/2022.
	//

import SwiftUI

struct DataView: View {
		// MARK: - Properties
	@State private var data = RollData(status: "", authenticated: false, supportedVersions: [])
	
	
		// MARK: - Body
	var body: some View {
		VStack(alignment: .leading) {
			Text("Status: \(data.status)")
			let boolAsString = String(data.authenticated)
			Text("Authenticated: \(boolAsString)")
			Text("Supported Versions:")
			ForEach (data.supportedVersions, id: \.self) { version in
				Text("\(version)")
			}
		}
		.onAppear{
			self.getData()
			
		}
		
	}
	
		// MARK: - Functions
	func getData() {
		let urlString = "https://api.countroll.com"
		let url = URL(string: urlString)
		
		URLSession.shared.dataTask(with: url!) { data, _, _ in
			DispatchQueue.main.async {
				if let data = data {
					do {
						let decoder = JSONDecoder()
						let decodedData = try decoder.decode(RollData.self, from: data)
						self.data = decodedData
					} catch {
						print("Error! Something went wrong")
					}
				}
			}
		}
		.resume()
	}
	
	func signIn() {
		print("sign in")
	}
	
}

struct DataView_Previews: PreviewProvider {
	static var previews: some View {
		DataView()
	}
}
