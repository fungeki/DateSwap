//
//  AppDelegate.swift
//  DateSwap
//
//  Created by Ran Loock on 08/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

   
    
    @UIApplicationMain
    // [START signin_delegate]
    class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
        // [END signin_delegate]
        var window: UIWindow?
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions
            launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
            // [START firebase_configure]
            // Use Firebase library to configure APIs
            FirebaseApp.configure()
            // [END firebase_configure]
            // [START setup_gidsignin]
            GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
            GIDSignIn.sharedInstance().delegate = self
            // [END setup_gidsignin]
            FBSDKApplicationDelegate.sharedInstance().application(application,
                                                                  didFinishLaunchingWithOptions:launchOptions)
            return true
        }
        
        // [START new_delegate]
        @available(iOS 9.0, *)
        func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
            -> Bool {
                // [END new_delegate]
                return self.application(application,
                                        open: url,
                                        // [START new_options]
                    sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                    annotation: [:])
        }
        // [END new_options]
        // [START old_delegate]
        func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
            // [END old_delegate]
            if handlePasswordlessSignIn(withURL: url) {
                return true
            }
            if GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation) {
                return true
            }
            return FBSDKApplicationDelegate.sharedInstance().application(application,
                                                                         open: url,
                                                                         // [START old_options]
                sourceApplication: sourceApplication,
                annotation: annotation)
        }
        // [END old_options]
        func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
            return userActivity.webpageURL.flatMap(handlePasswordlessSignIn)!
        }
        
        func handlePasswordlessSignIn(withURL url: URL) -> Bool {
            let link = url.absoluteString
            // [START is_signin_link]
            if Auth.auth().isSignIn(withEmailLink: link) {
                // [END is_signin_link]
                UserDefaults.standard.set(link, forKey: "Link")
                (window?.rootViewController as? UINavigationController)?.popToRootViewController(animated: false)
                window?.rootViewController?.childViewControllers[0].performSegue(withIdentifier: "passwordless", sender: nil)
                return true
            }
            return false
        }
        
        // [START headless_google_auth]
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
            // [START_EXCLUDE]
            guard let controller = GIDSignIn.sharedInstance().uiDelegate as? MainViewController else { return }
            // [END_EXCLUDE]
            if let error = error {
                // [START_EXCLUDE]
                controller.showMessagePrompt(error.localizedDescription)
                // [END_EXCLUDE]
                return
            }
            
            // [START google_credential]
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            // [END google_credential]
            // [START_EXCLUDE]
            controller.firebaseLogin(credential)
            // [END_EXCLUDE]
        }
        // [END headless_google_auth]
}
