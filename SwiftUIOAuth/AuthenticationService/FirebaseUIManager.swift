//
//  FBAuthView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 24/03/2021.
//

import Firebase
import FirebaseUI

typealias FUM = FirebaseUIManager

class FirebaseUIManager : NSObject{
        
    static let shared = FirebaseUIManager()
    
    private var withNavigationBar : Bool = false

    var authViewController : UIViewController {
        if (withNavigationBar){
            
            let authVC = MyAuthViewController(authUI: FUIAuth.defaultAuthUI()!)
            let nav = UINavigationController(rootViewController: authVC)
            return nav
        }
        return MyAuthViewController(authUI: FUIAuth.defaultAuthUI()!)
    }
    
    init(withNavigationBar : Bool = false){
        
        FirebaseApp.configure()
        super.init()
        self.withNavigationBar = withNavigationBar
        self.setupProviders()
    }
    
    
    private func setupProviders(){
        
        let providers: [FUIAuthProvider] = [
          FUIGoogleAuth(),
          /**FUIFacebookAuth(),
          FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!), */
        ]
        FUIAuth.defaultAuthUI()?.providers = providers
    }
    
}

extension FirebaseUIManager {
        
    
    func canHandle(url : URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool{
        
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
          return true
        }
        // other URL handling goes here.
        return false
    }
    
    func signOut(onError handler : ((Error?) -> Void)? = nil ){
        do {
  
          try FUIAuth.defaultAuthUI()?.signOut()
      
          if let handler = handler {
            
             handler(nil)
          }
        }
        catch (let err){
            
            if let handler = handler {
                
                handler(err)
            }
        }
    }
    
    
    func isSignedIn() -> Bool {
        
        if let _ = Firebase.Auth.auth().currentUser{
        
            return true
        }
    
        return false
    }
}


extension FirebaseUIManager {
    
    func setAuthDelegate(_ delegate : FUIAuthDelegate){
        
        FUIAuth.defaultAuthUI()?.delegate = delegate
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
