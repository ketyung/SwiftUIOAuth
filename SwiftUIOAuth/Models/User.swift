//
//  User.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 25/03/2021.
//

import Foundation

struct User : Codable {
    
    var userId : String = ""
    
    var displayName : String = ""
    
    private var signedIn : Bool = false
    
    var hasSignedIn : Bool {
        
        set(newSignedIn){
            
            self.signedIn = newSignedIn
        }
        
        get{
            
            return self.signedIn && AM.shared.isSignedIn()
        }
    }
}
