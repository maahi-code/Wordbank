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
                    Label("Words", systemImage: "book.closed")
                }
            
            ReviewView()
                .tabItem {
                    Label("Review", systemImage: "bubble.left.and.bubble.right")
                }
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            
        }
    }
}

#Preview {
    TabBarView()
}
