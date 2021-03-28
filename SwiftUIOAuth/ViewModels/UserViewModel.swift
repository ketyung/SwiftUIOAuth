//
//  UserViewModel.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 25/03/2021.
//

import Foundation
import FirebaseUI

class UserViewModel : NSObject, ObservableObject {
    
    @Published private var user =  DS.shared.load() {
        
        didSet {
            saveUser()
        }
    }
    
    override init(){
        
        super.init()
        AM.shared.setAuthDelegate(self)
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
        
       // print("signIned...")
        
        if let result = authDataResult {
            
            self.user.hasSignedIn = true
            
            if let name = result.user.displayName {
           
                self.user.displayName = name
            }
                
            self.user.userId = result.user.uid
            
        }
    }
    
}

extension UserViewModel {
    
    
    func saveUser(){
        
        DS.shared.save(user)
       // print("saved.User::")
    }
}


extension UserViewModel {
    
    
    func signOut(){
        AM.shared.signOut{
            err in
            if let err = err {
                print("Signed out error :\(err)")
            }
            else {
                self.user.hasSignedIn = false
                DS.shared.removeUser()
            }
        }
        
    }
}
