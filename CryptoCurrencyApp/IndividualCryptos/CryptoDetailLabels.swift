//
//  CryptoDetailLabels.swift
//  TestApp
//
//  Created by Paul Chung on 11/6/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import Foundation
import UIKit

class CryptoDetailLabels:UILabel{
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        self.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 0.75)
        self.font = self.font.withSize(13)
    }

}
