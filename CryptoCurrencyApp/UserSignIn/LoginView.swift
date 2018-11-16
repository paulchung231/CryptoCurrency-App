//
//  LoginView.swift
//  TestApp
//
//  Created by Paul Chung on 11/7/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import Foundation
import UIKit

class LoginView: UIViewController{
    
    
    
    let email_text_field: LeftPaddedTextField = {
        let text_field = LeftPaddedTextField()
//        text_field.placeholder = "Enter email"
        text_field.textColor = .white
        text_field.backgroundColor = UIColor.init(red: 88.0/255, green: 98.0/255, blue: 120.0/255, alpha: 0.25)
        text_field.attributedPlaceholder = NSAttributedString(string: "Enter email",
                                                               attributes: [NSForegroundColorAttributeName: UIColor.init(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 0.25)])
        text_field.keyboardType = .emailAddress
        text_field.autocapitalizationType = .none
        return text_field
    }()
    
    let password_text_field: LeftPaddedTextField = {
        let text_field = LeftPaddedTextField()
        //        text_field.placeholder = "Enter email"
        text_field.textColor = .white
        text_field.backgroundColor = UIColor.init(red: 88.0/255, green: 98.0/255, blue: 120.0/255, alpha: 0.25)
        text_field.attributedPlaceholder = NSAttributedString(string: "Enter password",
                                                              attributes: [NSForegroundColorAttributeName: UIColor.init(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 0.25)])
        text_field.isSecureTextEntry = true
        text_field.autocapitalizationType = .none
        return text_field
    }()
    
    override func viewDidLoad(){

        view.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)

        let login_title = UILabel(frame: CGRect.zero)
        login_title.text = "Block"
        login_title.frame = CGRect(x: view.frame.minX + 50, y: view.frame.minY + 70, width: 300, height: 100)
        login_title.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 1.0)
        login_title.textAlignment = .center
        login_title.center.x = self.view.center.x
        login_title.font = login_title.font.withSize(40)
        
        let login_button = UIButton()
        login_button.setTitle("Log in", for: .normal)
        login_button.setTitleColor(.white, for: .normal)
        login_button.titleLabel?.font =  .systemFont(ofSize: 13)
        login_button.frame = CGRect(x: (view.frame.maxX/2), y: (view.frame.maxY/2 + 115), width: 300, height: 35)
        login_button.center.x = self.view.center.x
        login_button.backgroundColor = UIColor.init(red: 68.0/255, green: 78.0/255, blue: 100.0/255, alpha: 1)
        login_button.addTarget(self, action: #selector(self.loginButtonAction), for: .touchUpInside)
        
        
        
        email_text_field.frame = CGRect(x: (view.frame.maxX/2), y: (view.frame.maxY/2 + 25), width: 300, height: 35)
        email_text_field.center.x = self.view.center.x
        
        password_text_field.frame = CGRect(x: (view.frame.maxX/2), y: (view.frame.maxY/2 + 70), width: 300, height: 35)
        password_text_field.center.x = self.view.center.x
        
        view.addSubview(password_text_field)
        view.addSubview(email_text_field)
        view.addSubview(login_title)
        view.addSubview(login_button)
//        view.addSubview(sign_up_button)
//        view.addSubview(reset_password_button)
    }
    
    @objc func loginButtonAction() {
        let controller = ViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        print("Login tapped")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}


class LeftPaddedTextField: UITextField{
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }
}
