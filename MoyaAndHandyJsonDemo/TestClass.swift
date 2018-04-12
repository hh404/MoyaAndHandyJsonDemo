//
//  TestClass.swift
//  MoyaAndHandyJsonDemo
//
//  Created by hans on 2018/4/12.
//  Copyright © 2018年 hans. All rights reserved.
//

import Foundation
import HandyJSON

class TestClass: HandyJSON ,CustomStringConvertible{
    
    required init() {
        
    }
    var name = ""
    var sub :SubTestClass = SubTestClass()
    
    var description: String{
        let r = Mirror(reflecting: self)
        var str = ""
        for i in r.children {
            str.append(i.label!)
            str.append(":")
            str.append(String(describing: i.value))
            str.append("\n")
        }
        return str
    }
}

class SubTestClass: HandyJSON,CustomStringConvertible {
    required init() {
        
    }
    var nickName = ""
    
    var description: String{
        let r = Mirror(reflecting: self)
        var str = ""
        for i in r.children {
            str.append(i.label!)
            str.append(":")
            str.append(String(describing: i.value))
            str.append("\n")
        }
        return str
    }
}



