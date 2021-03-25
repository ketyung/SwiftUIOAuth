//
//  HomeView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 25/03/2021.
//

import SwiftUI

struct HomeView : View {
    
    @EnvironmentObject private var userViewModel : UserViewModel
   
    
    var body : some View {
        
        VStack(spacing: 50){
            
            Text("Welcome Back \(userViewModel.displayName)")
            .font(.headline)
            
            Button(action: {
                userViewModel.signOut()
            }){
                
                Text("Sign Out")
            }
        }
    }
}
