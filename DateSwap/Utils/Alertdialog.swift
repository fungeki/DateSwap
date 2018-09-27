//
//  Alertdialog.swift
//  DateSwap
//
//  Created by Ran Loock on 17/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

func popAlert(title: String, message: String, view: UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
        alert.dismiss(animated: true)
    }))

    view.present(alert, animated: true, completion: nil)

}
func popAlert(title: String, message: String, view: UIViewController, acceptText: String, completion: @escaping (() -> Void)){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
        alert.dismiss(animated: true)
    }))
    alert.addAction(UIAlertAction(title: acceptText, style: .default, handler: { (action) in
        completion()
    }))
    
    view.present(alert, animated: true, completion: nil)
    
}

//    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//        switch action.style{
//        case .default:
//            print("default")
//
//        case .cancel:
//            print("cancel")
//
//        case .destructive:
//            print("destructive")
//
//
//        }}))
