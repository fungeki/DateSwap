//
//  SwipeToLikeUIViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 28/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class SwipeToLikeUIViewController: UIViewController {
    @IBOutlet weak var productCardUIView: ProductCardUIView!
    
    @IBOutlet weak var mainImageUIImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        mainImageUIImageView.layer.cornerRadius = productCardUIView.cornerRadius
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
