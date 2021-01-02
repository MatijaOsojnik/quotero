//
//  quoteroApp.swift
//  quotero
//
//  Created by Matija Osojnik on 14/12/2020.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct quoteroApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    QuoteListView()
                }
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Today")
                }
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Image(systemName: "sun.max.fill")
                    Text("Journey")
                }
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Image(systemName: "heart.text.square.fill")
                    Text("Liked")
                }
            }
            
        
        }
    }
}
