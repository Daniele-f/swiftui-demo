//
//  RollData.swift
//  Demo
//
//  Created by Administrator on 03/06/2022.
//

import SwiftUI

struct RollData: Codable {
	var status: String
	var authenticated: Bool
	var supportedVersions: [String]
}
