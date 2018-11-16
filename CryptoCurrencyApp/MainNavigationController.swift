//
//  MainNavigationController.swift
//  TestApp
//
//  Created by Paul Chung on 11/7/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 20.0/255, green: 30.0/255, blue: 52.0/255, alpha: 1)
        if isLoggedIn() {
            let home_controller = ViewController()
            viewControllers = [home_controller]
        }
        else
        {
            perform(#selector(showLoginView), with: nil, afterDelay: 0.01)
            
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return true
    }
    
    func showLoginView() {
        let login_controller = LoginView()
//        present(login_controller, animated: true, completion: {
//
//        })
        viewControllers = [login_controller]
    }
}
