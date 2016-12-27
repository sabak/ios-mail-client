//
//  Mail Service.swift
//  InternMail
//
//  Created by Saba on 12/27/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit
import Alamofire

extension MailService {
    
    func login(username     : String,
               pass         : String,
               complete     : @escaping (IMResponse<[IMUser]>?)->Void){
        
        let params = [    "type"        : "auth",
                          "username"    : username,
                          "password"    : pass]
        
        loggedIn (parameters: params, complete: complete)
    }
    
    func loggedIn (parameters: Parameters, complete: @escaping (IMResponse<[IMUser]>?)->Void){
        self.parsePostData(parameters: parameters, url: "") { response in
            
            var serviceResponse = IMResponse<[IMUser]>()
            var result = [IMUser]()
            
            if let res = response.result as? [String : AnyObject] {
                
                let success = res["success"] as? Bool
                
                if success!{
                    if let objects = res["data"] as? [[String:AnyObject]] {
                        for item in objects {
                            let selectObject = IMUser(properties: item)
                            result.append(selectObject)
                        }
                    }
                    serviceResponse.result = result
                }else {
                    serviceResponse.error = res["errorMessage"] as? String as! Error?
                }
            }
            
            complete(serviceResponse)
        }
    }
}
