//
//  ViewController.swift
//  Polls
//
//  Created by Abdelrahman Mohamed on 6/9/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    let ref = Firebase(url: "https://polls-obada.firebaseio.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connectWithFacebookAction(sender: AnyObject) {
        
        connectWithFacebook()
    }
    
    func connectWithFacebook() {
        
        let facebookLogin = FBSDKLoginManager()
        
//        facebookLogin.logInWithPublishPermissions(["email"], fromViewController: self) { (facebookResult, facebookError) in
//            
//            if facebookError != nil {
//                print("Facebook login failed. Error \(facebookError)")
//            } else if facebookResult.isCancelled {
//                print("Facebook login was cancelled.")
//            } else {
//                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
//                self.ref.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
//                    if error != nil {
//                        print("Login failed. \(error)")
//                    } else {
//                        print("Logged in! \(authData)")
//                    }
//                })
//            }
//        }
        
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookResult, facebookError) in
            
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled.")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                self.ref.authWithOAuthProvider("facebook", token: accessToken,
                                               withCompletionBlock: { error, authData in
                                                if error != nil {
                                                    print("Login failed. \(error)")
                                                } else {
                                                    print("Logged in! \(authData)")
                                                }
                })
            }
        }
        
//        facebookLogin.logInWithReadPermissions(["email"], handler: {
//            (facebookResult, facebookError) -> Void in
//            if facebookError != nil {
//                print("Facebook login failed. Error \(facebookError)")
//            } else if facebookResult.isCancelled {
//                print("Facebook login was cancelled.")
//            } else {
//                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
//                self.ref.authWithOAuthProvider("facebook", token: accessToken,
//                    withCompletionBlock: { error, authData in
//                        if error != nil {
//                            print("Login failed. \(error)")
//                        } else {
//                            print("Logged in! \(authData)")
//                        }
//                })
//            }
//        })
        
        
        
    }
    
}

