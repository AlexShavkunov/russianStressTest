//
//  russianStressTestApp.swift
//  russianStressTest
//
//  Created by Alex Shavkunov on 16.12.2024.
//

import SwiftUI

@main
struct russianStressTestApp: App {
    
    init() {
        PythonLib.initPython()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
