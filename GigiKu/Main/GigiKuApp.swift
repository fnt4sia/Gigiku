//
//  GigiKuApp.swift
//  GigiKu
//
//  Created by MacBook Air on 08/05/24.
//

import SwiftUI

@main
struct GigiKuApp: App {
    init(){
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.array(forKey: "character") != nil {
                ContentView()
            } else {
                OnboardingPage()
            }
        }
    }
}
