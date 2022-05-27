//
//  ScannerView.swift
//  Demo
//
//  Created by Administrator on 27/05/2022.
//

import SwiftUI
import CodeScanner


struct ScannerView: View {
	init() {
		UITableView.appearance().showsVerticalScrollIndicator = false
		UITableView.appearance().showsHorizontalScrollIndicator = false
	}
	
		// MARK: - Properties
	@State private var isShowingScanner = false
	@State private var scannedCode: String = "Scan a QR Code to get started."
	
		// MARK: - Body
	var body: some View {
		List {
			Section (header: Text("QR Scanner")) {
				HStack {
					Spacer()
					VStack {
						ZStack(alignment: .center) {
							scannerSheet
							
							ScanOverlayView()
							
						} // ZStack
						.frame(width: 260, height: 260)
						.cornerRadius(30)
						.padding(.top, 10)
						
						Text(scannedCode)
						
					} // VStack
					Spacer()
				} // HStack
				.listRowSeparator(.hidden)
			} // Section
		} // List
	}
	
	// MARK: - Functions
		//  CodeScanner by TwoStraws
		//  https://github.com/twostraws/CodeScanner
	var scannerSheet : some View {
		return CodeScannerView(
			codeTypes: [.qr,
						.code128, .code39, .code93],
			//scanMode: .oncePerCode,
			scanMode: .continuous, scanInterval: 2.0,
			//			showViewfinder: true,
			completion: { result in
				if case let .success(code) = result {
					self.scannedCode = code.string
					self.isShowingScanner = false
				}
			}
		) // CodeScanner
	}
}

struct ScannerView_Previews: PreviewProvider {
	static var previews: some View {
		ScannerView()
	}
}
