//
//  IMBaseModel.swift
//  InternMail
//
//  Created by George Vashakidze on 12/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class IMBaseModel : NSObject {
    
    fileprivate lazy var props = [String:Any]()
    
    override init() {
        super.init()
    }
    
    required init(properties: [String:Any]) {
        super.init()
        self.props = properties
        self.setValues()
    }
    
    func setValues() {
        // Override
    }
    
    override var description: String {
        get {
            return self.props.description
        }
    }
    
    func getValue<T:Any>(_ key: String, type:T.Type) -> T? {
        if let val = self.props[key] {
            return val as? T
        }
        
        return nil
    }
    
    func getValue(_ key:String) -> Any? {
        
        if let val = self.props[key] {
            return val
        }
        
        return nil
    }
    
    func setValue(_ key: String, value: Any?) {
        self.props[key] = value
    }
    
    func getValues() -> [String : Any] {
        return self.props
    }
}
