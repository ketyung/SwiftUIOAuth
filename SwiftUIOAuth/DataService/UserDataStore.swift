//
//  UserDataStore.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 25/03/2021.
//

import Foundation

typealias DS  = UserDataStore

struct UserDataStore {
    
    static let shared = UserDataStore()

    private let key = "com.techchee.savedUser"
   
    
    func save(_ user : User ){
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: key)
        }
    }
    
    
    func load() -> User{
        
        let defaults = UserDefaults.standard
        
        if let savedUser = defaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
              
                return loadedUser
            }
        }
        
        return User()
    }
    
    func removeUser() {
        
        let defaults = UserDefaults.standard
     
        defaults.removeObject(forKey: key)
    }
}


