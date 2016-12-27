//
//  MailService.swift
//  InternMail
//
//  Created by Saba on 12/7/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit
import Alamofire

var BASE_URL = "http://mgldev.ge/maprest/auth.php"

class MailService : NSObject {
    
    let headers = [String: String]()
    
    static let sharedInstance : MailService = {
        let instance = MailService()
        return instance
    }()
    
    func getJSONObjFromData(_ jsonData: Data)->Any? {
        
        do {
            return try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch let _ as NSError {
            //dlog(e.description as AnyObject?)
            return nil
        }
    }
    
}

extension MailService {
    
    func convertStringToDictionary(jsonData: Data)->Any? {
        do {
            return try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
    
    func parsePostData(parameters: Parameters?, url: String, completion:@escaping (_ response: IMResponse<Any?>)->Void) {
        
        Alamofire.request(BASE_URL + url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .response { response in
                if let err = response.error {
                    print(err)
                } else {
                    if let data = response.data {
                        if let obj = self.getJSONObjFromData(data) as? [String: AnyObject] {
                            if response.response?.statusCode == 200 {
                                let result = IMResponse<Any?>()
                                result.result = obj
                                completion(result)
                            } else {
                                //handle error here
                            }
                        }
                    }
                }
        }
    }
    
}
