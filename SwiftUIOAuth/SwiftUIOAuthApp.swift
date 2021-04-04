//
//  SwiftUIOAuthApp.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 24/03/2021.
//

import SwiftUI

@main
struct SwiftUIOAuthApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @StateObject private var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            //TestView()
            view()
            .environmentObject(userViewModel)
        }
    }
}


extension SwiftUIOAuthApp {
    
    @ViewBuilder
    private func view() -> some View {
        
        if ( userViewModel.hasSignedIn ){
            
            TabbedView()
        }
        else {
          
            SignInView()
        }
    }
}
