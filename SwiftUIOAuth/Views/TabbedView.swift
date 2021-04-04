//
//  TestView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 27/03/2021.
//

import SwiftUI

struct TabbedView : View {
    
    @State private var selectedTab : Int = 0
    
    var body : some View {
        
        tabbedViews()
        .onAppear{
            // always reset back to zero
            self.selectedTab = 0
        }
    }
}


extension TabbedView {
    
    
    func tabbedViews() -> some View {
        
        TabView(selection: $selectedTab ){
           
            HomeView()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
            
            SettingsView()
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
            .tag(1)
                
            BlogPostsView()
            .tabItem {
                Label("Tutorials", systemImage: "book")
            }
            .tag(3)
           
        }
    }
}
