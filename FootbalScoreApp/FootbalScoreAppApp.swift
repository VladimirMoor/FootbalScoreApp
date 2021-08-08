//
//  FootbalScoreAppApp.swift
//  FootbalScoreApp
//
//  Created by Vladimir on 07.08.2021.
//

import SwiftUI
import CoreData

@main
struct FootbalScoreAppApp: App {
    
    let coreDataManager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.context)
        }
    }
}
