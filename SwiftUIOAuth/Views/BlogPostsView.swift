//
//  MenuView.swift
//  SwiftUILocalNoti
//
//  Created by Chee Ket Yung on 11/03/2021.
//

import SwiftUI

struct BlogPostsView : View {
    
    var body: some View {
        
        NavigationView {
        
            List {
            
                NavigationLink(destination: WebView(urlString : "https://blog.techchee.com/add-sign-in-with-firebaseui-in-swiftui-app/")){
                    
                   Text("1. Add Google OAuth, FB, Twitter sign-in with FirebaseUI in your SwiftUI app")
                }
            
                NavigationLink(destination: WebView(urlString : "https://blog.techchee.com/scheduling-local-notification-swiftui")){
                    
                   Text("2. Handling FirebaseUI sign-in in SwiftUI - the MVVM way")
                }
            
            }
            .navigationTitle(Text("Blog Posts"))
            
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    

}
