//
//  IMUser.swift
//  InternMail
//
//  Created by Saba on 12/7/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit

class IMUser: IMBaseModel {
    
    var firstname   : String!
    var lastname    : String!
    var mobile      : String!
    var username    : String!
    var id          : String!
    
    override func setValues() {
        self.id        = self.getValue("id") as! String
        self.username  = self.getValue("username")as? String
        self.mobile    = self.getValue("mobile") as? String
        self.lastname  = self.getValue("lastname") as? String
        self.firstname = self.getValue("firstname") as! String
    }
    
}
