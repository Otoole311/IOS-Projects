//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Otoole on 07/03/2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(DataModel())
                .preferredColorScheme(.light)
        }
    }
}
