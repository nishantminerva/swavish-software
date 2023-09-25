//
//  Swavish_SoftwareApp.swift
//  Swavish Software
//
//  Created by Nishant Minerva on 24/09/23.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject,  UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
 
@main
struct Swavish_SoftwareApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {}
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
