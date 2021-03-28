//
//  HomeView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 25/03/2021.
//

import SwiftUI

struct HomeView : View {
    
    @EnvironmentObject private var userViewModel : UserViewModel
   
   // @State private var isAnimating = true
    
    var body : some View {
        
        VStack(spacing:5) {
       
            Text("Welcome Back")
            .font(.body)
            
            Text(userViewModel.displayName)
            .font(.headline)
           
            Spacer()
            .frame(height:50)
            
            Image("welcome")
                /**
            .scaleEffect(self.isAnimating ? 0.8: 1)
            .animation(Animation.linear(duration: 1).repeatForever())
            .onAppear{
                self.isAnimating.toggle()
            }*/
            
        }
    }
}
