//
//  ProfileController.swift
//  TestApp
//
//  Created by Paul Chung on 11/2/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
        
        let label_name = UILabel()
        label_name.frame = CGRect(x: 40, y: 70, width: 300, height: 100)
        label_name.text = "Profile Name"
        label_name.textColor = UIColor.white
        
        let lower_pos = CGRect(x:view.frame.minX , y:(view.frame.maxY/2), width: view.frame.maxX, height: (view.frame.maxY/2))
        let bottom_view = UIView(frame: lower_pos)
        /*choose one of these colors*/
        bottom_view.backgroundColor = UIColor(red: 20.0/255, green: 30.0/255, blue: 52.0/255, alpha: 1)
//        bottom_view.backgroundColor = UIColor(red: 20/255, green: 48/255, blue: 79/255, alpha: 1.0)
        
        self.view.addSubview(bottom_view)
        self.view.addSubview(label_name)
    }
    
}
