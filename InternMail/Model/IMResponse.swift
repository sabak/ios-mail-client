//
//  IMResponse.swift
//  InternMail
//
//  Created by Saba on 12/11/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit

class IMResponse<T>: Error {
    var result : T?
    var error : Error?
}
