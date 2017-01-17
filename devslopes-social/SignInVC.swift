//
//  SignInVC.swift
//  devslopes-social
//
//  Created by Michael L Gueterman on 1/16/17.
//  Copyright © 2017 Michael L Gueterman. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var pwdField: FancyField!
    @IBOutlet weak var emailField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        print("Prior to FBSDKLoginManager")
        let facebookLogin = FBSDKLoginManager()
        print("After to FBSDKLoginManager")
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Facebook \(error)")
            } else if result?.isCancelled == true {
                print("JESS: User cancelled Facebook authentication.")
            } else {
                print("JESS: Successfully authenticated with Facebook.")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth( _ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Firebase - \(error)")
            } else {
                print("JESS: Successfully authenticated with Firebase.")
            }
            
        })
    }

    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("JESS: Email User authenticated with Firebase.")
                } else {
                    print("Initial attempt to authenticate with Firebase failed: \(error).")
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("JESS: Unable to create user with Firebase using email. \(error)")
                        } else {
                            print("JESS: Successfully created email user with Firebase.")
                        }
                    })
                }
            })
        }
    }
}

