//
//  AppDelegate.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 08-12-24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configura Firebase
        FirebaseApp.configure()

        // ... Resto de tu código de inicialización

        return true
    }
}
