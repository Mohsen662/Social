//
//  ViewController.swift
//  Social
//
//  Created by mohsen on 10/8/1395 AP.
//  Copyright © 1395 irswift. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var pswFeild: FancyField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
        
            if error != nil {
                print("Unable to connect to facebook: \(error)")
            } else if result?.isCancelled == true {
                print("User cancelled facebook aunthentication")
            } else {
                print("suuccessfuly connected to facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            
            if error != nil {
                print("Unable to connect to firebase: \(error)")
            } else {
                print("Successfuly authenticated to firebase")
            }
        })
    }
    
    @IBAction func signinTapped(_ sender: AnyObject) {
        if let email = emailField.text, let psw = pswFeild.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: psw, completion: { (user, error) in
                
                if error == nil {
                    print("MOHSEN: Email user authenticated with firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: psw, completion: { (user, error) in
                        
                        if error != nil {
                            print("MOHSEN: Unable to authenticate to firebase using email")
                        } else {
                            print("MOHSEN: Successfuly authenticated with firebase. ")
                        }
                    })
                }
            })
        }
    }

}












