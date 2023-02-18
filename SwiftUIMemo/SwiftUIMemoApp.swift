//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 신동희 on 2023/02/18.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
