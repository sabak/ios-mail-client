//
//  RegistrationViewController.swift
//  InternMail
//
//  Created by Saba on 12/27/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var username:        UITextField!
    @IBOutlet weak var firstName:       UITextField!
    @IBOutlet weak var lastName:        UITextField!
    @IBOutlet weak var password:        UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var mobileNumber:    UITextField!
    
    @IBAction func registerClicked(_ sender: UIButton) {
        
        weak var wSelf = self
        
        if (confirmPassword.text != password.text){
            return
        }

        
        MailService.sharedInstance.registerNewUser(username    : username.text!,
                                                   firstName   : firstName.text!,
                                                   lastName    : lastName.text!,
                                                   mobileNumber : mobileNumber.text!,
                                                   password    : password.text!)
        { (response) -> Void in
            if (response?.error) != nil {
                if response?.error == "The username already exists!" {
                    wSelf?.username.text = ""
                }
                
            }else{
                CurrentUser.sharedInstance.user = response?.result?[0]
                print(CurrentUser.sharedInstance.user.description as Any)
                
                self.dismiss(animated: true, completion: nil)
                
            }
        }
    }
    
    func register (){
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
