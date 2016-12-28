//
//  DetailViewController.swift
//  InternMail
//
//  Created by Saba on 12/27/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var email: IMMail?
    
    @IBOutlet weak var subject: UITextView!
    @IBOutlet weak var sender:  UITextView!
    @IBOutlet weak var body:    UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        body.text       = email?.text
        subject.text    = email?.subject
        sender.text     = email?.from.username
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
