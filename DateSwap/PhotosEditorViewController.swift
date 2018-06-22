//
//  PhotosEditorViewController.swift
//  DateSwap
//
//  Created by Dor tzemach on 22/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class PhotosEditorViewController: UIViewController {

    @IBOutlet weak var MainPhotoUIbutton: UIButton!
    @IBOutlet weak var SubPhotoLeftTop: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        MainPhotoUIbutton.addJeansEffect(UIColor.orange.cgColor)
        SubPhotoLeftTop.addJeansEffect(UIColor.orange.cgColor)
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
