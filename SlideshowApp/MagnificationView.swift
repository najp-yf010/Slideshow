//
//  MagnificationView.swift
//  SlideshowApp
//
//  Created by  NSPC358admin on 2023/11/08.
//

import Foundation
import UIKit

class MagnificationView: UIViewController {
    
    @IBOutlet weak var MagnificationImage: UIImageView!
    
    var Image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MagnificationImage.image = Image
    }
    
    @IBAction func Viewbackbutton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

