//
//  FBAuthView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 24/03/2021.
//

import SwiftUI
import Firebase
import FirebaseUI
import FirebaseAuth

typealias FAM = FirebaseAuthManager

class FirebaseAuthManager : NSObject, FUIAuthDelegate {
    
    
    static let shared = FirebaseAuthManager()
    
    
    private var authUI : FUIAuth?
    
    
    override init(){
        
        FirebaseApp.configure()
        super.init()
        
        if let authUI = FUIAuth.defaultAuthUI(){
        
            authUI.delegate = self
            self.authUI = authUI
        }
        
        self.setupProviders()
    }
    
    
    private func setupProviders(){
        
        let providers: [FUIAuthProvider] = [
          FUIGoogleAuth(),
          /**FUIFacebookAuth(), */
          FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),
        ]
        self.authUI?.providers = providers
    }
    
}

extension FirebaseAuthManager {
    
    func view() -> UIView {
        
        return authUI!.authViewController().view
    }
    
    
    func canHandle(url : URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool{
        
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if self.authUI?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
          return true
        }
        // other URL handling goes here.
        return false
    }
}

