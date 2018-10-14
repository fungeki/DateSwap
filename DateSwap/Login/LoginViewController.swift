//
//  LoginViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 31/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController, GIDSignInUIDelegate {
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        }
//        popAlert(title: "Oopsie", message: "login through facebook isnt supported yet, please log in with google", view: self)
//       // let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
////        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
////            if let error = error {
////                // ...
////                return
////            }
////            popAlert(title: "Oopsie", message: "login through facebook isnt supported yet, please log in with google", view: self)
////            // User is signed in
////            // ...
////        }
//        // ...
//    }
//    
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        popAlert(title: "logged out", message: "yay!", view: self)
//    }
    

    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
       // fbLoginButton.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    @IBAction func fbSignIn(_ sender: Any) {
//        let fbLoginManager = FBSDKLoginManager()
//        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
//            if let error = error {
//                print("Failed to login: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let accessToken = FBSDKAccessToken.current() else {
//                print("Failed to get access token")
//                return
//            }
//            
//            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
//            
//            // Perform login by calling Firebase APIs
//            Auth.auth().signIn(with: credential, completion: { (user, error) in
//                if let error = error {
//                    print("Login error: \(error.localizedDescription)")
//                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
//                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    alertController.addAction(okayAction)
//                    self.present(alertController, animated: true, completion: nil)
//                    
//                    return
//                }
//                 popAlert(title: "Oopsie", message: "login through facebook isnt supported yet, please log in with google", view: self)
//                // Present the main view
////                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
////                    UIApplication.shared.keyWindow?.rootViewController = viewController
////                    self.dismiss(animated: true, completion: nil)
////                }
//
//            })
//    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
