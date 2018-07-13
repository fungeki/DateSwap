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
  
    @IBOutlet weak var SubPhotoTopLeftUIbutton: UIButton!
    @IBOutlet weak var SubPhotoTopMiddleUIbutton: UIButton!
    @IBOutlet weak var SubPhotoTopRightUIbutton: UIButton!
    @IBOutlet weak var SubPhotoBottomLeftUIbutton: UIButton!
    @IBOutlet weak var SubPhotoBottomMiddleUIbutton: UIButton!
    @IBOutlet weak var SubPhotoBottomRightUIbutton: UIButton!
    
    @IBOutlet weak var heightForMainPhotoNSLayoutConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
       // heightForMainPhotoNSLayoutConstraint.constant = 583.0 / 1.83
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
       
        
        MainPhotoEditorPhotosUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,6])
        
        SubPhotoTopLeftUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,6])
        
        SubPhotoTopMiddleUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,6])
        
         SubPhotoTopRightUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,6])
        
        SubPhotoBottomLeftUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,6])
        
           SubPhotoBottomMiddleUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,6])
        
            SubPhotoBottomRightUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,6])
        
        
        
        
        
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
