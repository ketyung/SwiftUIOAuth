//
//  UserViewModel.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 25/03/2021.
//

import Foundation
import FirebaseUI

class UserViewModel : NSObject, ObservableObject {
    
    @Published private var user = User()
    
    override init(){
        
        super.init()
        FAM.shared.setAuthDelegate(delegate: self)
    }
    
    var hasSignedIn : Bool {
        
        get{
            user.hasSignedIn
        }
        
        set(newHasSignedIn){
            
            user.hasSignedIn = newHasSignedIn
        }
    }
    
    
    var userId : String {
        
        user.userId
    }
    
    
    var displayName : String {
        
        user.displayName
    }
    
}

extension UserViewModel : FUIAuthDelegate{
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
     
        if let err = error {
            
            print("It's Error::\(err)")
            return
        }
        
        if let result = authDataResult {
            
            self.user.hasSignedIn = true
            self.user.displayName = result.user.displayName ?? ""
            self.user.userId = result.user.uid
        }
    }
    
}

extension UserViewModel {
    
    func clear(){
        user.displayName = ""
        user.hasSignedIn = false
        user.userId = ""
    }
    
    func signOut(){
        FAM.shared.signOut{
            err in
            if let err = err {
                print("Signed out error :\(err)")
            }
            else {
                
                self.clear()
                
            }
        }
        
    }
}
