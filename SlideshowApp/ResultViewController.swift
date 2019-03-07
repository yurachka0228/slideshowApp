//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 村瀬美緒 on 2019/02/18.
//  Copyright © 2019 jp.techacademy.mio.murase. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
 
    @IBOutlet weak var imageView: UIImageView!

    var image: UIImage!
    
    override func viewDidLoad() {
        imageView.image = image
        super.viewDidLoad()
        
    }
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
}

