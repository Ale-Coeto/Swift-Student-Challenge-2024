//
//  SSCApp.swift
//  SSC
//
//  Created by Alejandra Coeto on 26/02/24.
//

import SwiftUI

@main
struct SSCApp: App {
    let persistence = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
