	//
	//  ScannerView.swift
	//  Demo
	//
	//  Created by Administrator on 27/05/2022.
	//

import SwiftUI
import CodeScanner


struct ScannerView: View {
	
		// MARK: - Properties
	@State private var isShowingScanner = false
	@State private var scannedCode: String = "Scan a QR Code to get started."
	
		// MARK: - Body
	var body: some View {
		GeometryReader { geometry in
			ScrollView(showsIndicators: false) {
				VStack {
					VStack {
						Text("QR Scanner")
							.font(.headline)
							.padding(.top)
						
						HStack {
							Spacer()
							
							ZStack (alignment: .center){
								scannerFrame
								
								ScanOverlayView()
								
							} /// ZStack
							  //					.background(.green) //For testing purpose
							.frame(width: 260, height: 260, alignment: .center)
							.cornerRadius(30)
							.padding(.top, 10)
								//					.background(.red) //For testing purpose
							
							Spacer()
						} /// HStack
						.padding(.bottom)
					} /// VStack
					.frame(width: geometry.size.width * 0.9, alignment: .center)
					.background(Color.gray.opacity(0.5))
					.cornerRadius(30)
						//					.padding([.leading, .trailing], 10)
					
					VStack {
						Text("Scan QR Code")
							.font(.headline)
							.padding(.top)
						
						Text(scannedCode)
							.padding()
					} /// VStack
					.frame(minWidth: geometry.size.width * 0.9, minHeight: 100, alignment: .top)
					.background(Color.gray.opacity(0.5))
					.cornerRadius(30)
					
				} /// VStackt
				.padding(.vertical)
				.frame(width: geometry.size.width, alignment: .center)
				
			} /// ScrollView
		}
		.statusBar(hidden: false)
	}
	
	
		// MARK: - Functions
		///  CodeScanner by Paul Hudson @twostraws
		///  https://github.com/twostraws/CodeScanner
	var scannerFrame : some View {
		return CodeScannerView(
			codeTypes: [.qr,
						.code128, .code39, .code93, .dataMatrix],
			//scanMode: .oncePerCode,
			scanMode: .continuous, scanInterval: 2.0,
			//			showViewfinder: true,
			completion: { result in
				if case let .success(code) = result {
					self.scannedCode = code.string
					self.isShowingScanner = false
				}
			}
		) /// CodeScanner
	}
	
}

struct ScannerView_Previews: PreviewProvider {
	static var previews: some View {
		ScannerView()
	}
}
