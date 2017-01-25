//
//  FeedVC.swift
//  devslopes-social
//
//  Created by Michael L Gueterman on 1/25/17.
//  Copyright © 2017 Michael L Gueterman. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import FirebaseAuth

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signOutTapped(_ sender: Any) {
        print("About to sign out")
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("JESS: \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    


}
