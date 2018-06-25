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

        MainPhotoEditorPhotosUIbutton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [16,10])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
