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
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 70, width: 300, height: 100)
        label.text = "Profile Name"
        label.textColor = UIColor.white
        self.view.addSubview(label)
    }
    
}
