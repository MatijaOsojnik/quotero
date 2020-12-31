//
//  quoteroApp.swift
//  quotero
//
//  Created by Matija Osojnik on 14/12/2020.
//

import SwiftUI


@main
struct quoteroApp: App {
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
