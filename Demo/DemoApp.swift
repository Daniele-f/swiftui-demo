//
//  DemoApp.swift
//  Demo
//
//  Created by Administrator on 27/05/2022.
//

import SwiftUI

@main
struct DemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
