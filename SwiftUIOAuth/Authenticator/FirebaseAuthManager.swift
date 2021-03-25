//
//  FBAuthView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 24/03/2021.
//

import SwiftUI
import Firebase
import FirebaseUI

typealias FAM = FirebaseAuthManager

class FirebaseAuthManager : NSObject{
    
    
    static let shared = FirebaseAuthManager()
    
    private var withNavigationBar : Bool = false
    
    private var authUI : FUIAuth?

    
    var authViewController : UIViewController {
        if (withNavigationBar){
            
            let authVC = MyAuthViewController(authUI: authUI!)
            let nav = UINavigationController(rootViewController: authVC)
            return nav
        }
        return MyAuthViewController(authUI: authUI!)
    }
    
    init(delegate : FUIAuthDelegate? = nil, withNavigationBar : Bool = false){
        
        FirebaseApp.configure()
        
        super.init()
        
        self.withNavigationBar = withNavigationBar
        
        if let authUI = FUIAuth.defaultAuthUI(){
        
            authUI.delegate = delegate ?? self
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
        
    
    func canHandle(url : URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool{
        
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if self.authUI?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
          return true
        }
        // other URL handling goes here.
        return false
    }
}


extension FirebaseAuthManager : FUIAuthDelegate  {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
     
        if let err = error {
            
            print("It's Error::\(err)")
            return
        }
        
        if let result = authDataResult {
            print("result::userId::\(result.user.uid)")
        }
    }
}



class MyAuthViewController : FUIAuthPickerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = view.subviews[0]
        scrollView.backgroundColor = .clear
        let contentView = scrollView.subviews[0]
        contentView.backgroundColor = .clear

        view.backgroundColor = .clear
        
    }

}
