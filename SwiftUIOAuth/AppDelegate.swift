//
//  AppDelegate.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 25/03/2021.
//

import Foundation
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
     
        //return false
        return AM.shared.canHandle(url: url, options: options)
    }
}
