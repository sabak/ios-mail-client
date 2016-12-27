//
//  ViewController.swift
//  InternMail
//
//  Created by Saba on 12/11/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginClicked(_ sender: UIButton) {
        weak var wSelf = self

        MailService.sharedInstance.login(username: username.text!, pass: password.text!) { (response) -> Void in
            if (response?.error) == nil {
                
                CurrentUser.sharedInstance.user = response?.result?[0]
                print(CurrentUser.sharedInstance.user.description as Any)
                wSelf?.login()
            }
            
        }

        
    }
    
    func login() {
        UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tab_bar")
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    }

