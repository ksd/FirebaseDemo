//
//  FirebaseDemoApp.swift
//  FirebaseDemo
//
//  Created by ksd on 25/10/2024.
//

import SwiftUI
import FirebaseCore

@main
struct FirebaseDemoApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(UserController())
        }
    }
}
