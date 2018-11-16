//
//  CryptoDetailValues.swift
//  TestApp
//
//  Created by Paul Chung on 11/7/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import Foundation
import UIKit

class CryptoDetailValues:UILabel{
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        self.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)
        self.font = self.font.withSize(17)
    }
    
}
