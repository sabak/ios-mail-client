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
        
        loggedInOrRegistered (parameters: params, complete: complete)
    }
    
    func registerNewUser(username       : String,
                         firstName      : String,
                         lastName       : String,
                         mobileNumber   : String,
                         password       : String,
                         completion     : @escaping (IMResponse<[IMUser]>?)->Void){
        
        let params = ["type"            : "register",
                          "username"    : username,
                          "password"    : password,
                          "firstname"   : firstName,
                          "lastname"    : lastName,
                          "mobile"      : mobileNumber]
        
        loggedInOrRegistered(parameters: params, complete: completion)
        
    }
    
    func loggedInOrRegistered (parameters: Parameters, complete: @escaping (IMResponse<[IMUser]>?)->Void){
        self.parsePostData(parameters: parameters, url: "") { response in
            
            var serviceResponse = IMResponse<[IMUser]>()
            var result = [IMUser]()
            
            if let responseResult = response.result as? [String : AnyObject] {
                
                let success = responseResult["success"] as? Bool
                
                if success!{
                    if let objects = responseResult["data"] as? [[String:AnyObject]] {
                        for item in objects {
                            let selectObject = IMUser(properties: item)
                            result.append(selectObject)
                        }
                    }
                    serviceResponse.result = result
                }else {
                    serviceResponse.error = responseResult["errorMessage"] as? String
                }
            }
            
            complete(serviceResponse)
        }
    }
    
    func loadInboxItems(complete: @escaping (IMResponse<[IMMail]>?)->Void){
        let params = ["type"        : "data",
                      "emailType"   : "sent"]
        loadItems(parameters: params, complete: complete)
    }
    
    func loadSentItems(complete: @escaping (IMResponse<[IMMail]>?)->Void){
        let params = ["type"        : "data",
                      "emailType"   : "inbox"]
        loadItems(parameters: params, complete: complete)
    }
    
    
    func loadItems(parameters: Parameters?, complete: @escaping (IMResponse<[IMMail]>?)->Void){
        self.parsePostData(parameters: parameters, url: "") { response in
            
            var serviceResponse = IMResponse<[IMMail]>()
            var result = [IMMail]()
            
            if let responseResult = response.result as? [String : AnyObject] {
                if let objects = responseResult["data"] as? [[String:AnyObject]] {
                    for item in objects {
                        let selectObject = IMMail(properties: item)
                        result.append(selectObject)
                    }
                }
            }
            
            serviceResponse.result = result
            complete(serviceResponse)
        
        }
    }
}
