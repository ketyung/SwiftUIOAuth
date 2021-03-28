//
//  ContentView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 24/03/2021.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject private var userViewModel : UserViewModel
    
    var body: some View {
        
        signInView()
    }
}


extension SignInView {
    
    
    func signInView() -> some View {
        
        VStack {
            
            
            SignInViewUI()
            .padding()
            .frame(width: 300, height:240)
            .background(Color.green)
            .cornerRadius(30)
            .shadow(radius: 20 )
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
