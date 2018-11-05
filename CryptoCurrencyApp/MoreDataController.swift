//
//  MoreDataController.swift
//  TestApp
//
//  Created by Paul Chung on 1/31/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import UIKit

class MoreDataController: UIViewController {
    var cryptoDetails:Crypto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
        let label = UILabel()
        label.frame = CGRect(x: view.frame.minX + 50, y: view.frame.minY + 70, width: 300, height: 100)
        label.text = cryptoDetails?.name
        label.textColor = UIColor.white
        label.textAlignment = .center
        self.view.addSubview(label)

        if let this_cryptoDetails = cryptoDetails {
            let max_supply_label = UILabel()
            max_supply_label.frame = CGRect(x: 40, y: 100, width: 300, height: 100)
            max_supply_label.textColor = UIColor.white
            if let this_max_supply = this_cryptoDetails.max_supply {
                max_supply_label.text = "Max supply: " + this_max_supply
            }
            else
            {
                max_supply_label.text = "Max supply: N/A"
            }
            self.view.addSubview(max_supply_label)
        }
//        print(label)
    }
    
    func setCryptoData(cryptoDataReference:Crypto){
        cryptoDetails = cryptoDataReference
    }
}
