//
//  CurrentUser.swift
//  InternMail
//
//  Created by Saba on 12/27/16.
//  Copyright © 2016 Saba. All rights reserved.
//


import UIKit

class CurrentUser {
    var user: IMUser!
    
    static let sharedInstance : CurrentUser = {
        return CurrentUser()
    }()
}
