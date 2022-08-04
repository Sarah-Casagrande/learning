//
//  learningApp.swift
//  learning
//
//  Created by Sarah Casagrande on 8/4/22.
//

import SwiftUI

@main
struct learningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
