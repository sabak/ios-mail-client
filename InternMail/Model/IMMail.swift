//
//  IMMail.swift
//  InternMail
//
//  Created by Saba on 12/7/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit

class IMMail: IMBaseModel {

    
    var from : IMUser!
    var to : IMUser!
    var subject : String!
    var text : String!
    
    override var description: String{
        
        return String.init(format:"Subject: %@\nText: %@\nFrom: \n%@\nTo: \n%@\n", subject,text,from,to)
        
    }
    

    
}
