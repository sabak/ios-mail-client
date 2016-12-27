//
//  User Service.swift
//  InternMail
//
//  Created by George Vashakidze on 12/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

extension MailService {
    
    func Login(username:String, password: String, completion: @escaping (IMResponse<[IMUser]>?)->Void){
        
        let parameters = ["type" : "auth", "username" : username, "password" : password]
        
        self.parsePostData(parameters: parameters, url: "") { response in
            
            let resp = IMResponse<[IMUser]>()
            var result = [IMUser]()
            
            if let res = response.result as? [String : AnyObject] {
                if let o = res["data"] as? [[String:AnyObject]] {
                    for item in o {
                        let obj = IMUser(properties: item)
                        result.append(obj)
                    }
                }
            }
            
            resp.result = result
            
            completion(resp)
        }
    }
    
}
