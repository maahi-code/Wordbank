//
//  TabBarView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 10/09/26.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
           WordView()
                .tabItem {
                    Label("Words", systemImage: "eyes")
                }
            
            ReviewView()
                .tabItem {
                    Label("Review", systemImage: "bubble.left.and.bubble.right")
                }
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "person")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "person")
                }
            
        }
    }
}

#Preview {
    TabBarView()
}
