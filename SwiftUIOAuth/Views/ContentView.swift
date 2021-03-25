//
//  ContentView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 24/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var userViewModel : UserViewModel
    
    var body: some View {
        
        signInView()
    }
}


extension ContentView {
    
    
    func signInView() -> some View {
        
        VStack {
            
            SignInViewUI()
            .padding()
            .frame(width: 300, height:120)
            .background(Color.black)
            .cornerRadius(20)
            
            Spacer()
            .frame(height:200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
