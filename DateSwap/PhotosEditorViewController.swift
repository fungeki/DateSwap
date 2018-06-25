//
//  PhotosEditorViewController.swift
//  DateSwap
//
//  Created by Dor tzemach on 23/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class PhotosEditorViewController: UIViewController {

    @IBOutlet weak var MainPhotoEditorPhotosUIbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let a = UIScreen.main.bounds
        let b = UIScreen.main.scale
        let c = a.size.width * b
        let d = a.size.height * b
        MainPhotoEditorPhotosUIbutton.frame = CGRect(x: 0, y: 0, width: MainPhotoEditorPhotosUIbutton.frame.width, height:  582.303 / 1334.0 * d)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
       
        
        MainPhotoEditorPhotosUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [16,10])
        
        
        
        MainPhotoEditorPhotosUIbutton.setTitleColor(UIColor.init(cgColor: lightOrange()), for: .normal)
       // MainPhotoEditorPhotosUIbutton.frame.size = CGSize(width: MainPhotoEditorPhotosUIbutton.frame.width, height: 582.303 / UIScreen.main.scale)
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
