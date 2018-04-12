//
//  ViewController.swift
//  MoyaAndHandyJsonDemo
//
//  Created by hans on 2018/4/12.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import ObjectMapper
import HandyJSON

class MyTestClass: HandyJSON,CustomStringConvertible {
    var name = "zhangsan"
    required init() {
        
    }
    
    var description: String{
        let r = Mirror(reflecting: self)
        var str = ""
        for i in r.children {
            print(i.label,i.value)
            str.append(i.label!)
            str.append(String(describing: i.value))

            //if(r.children.startIndex<r.children.endIndex)
            //i.label
            // print("属性名:\(r.children[i].0!)，值:\(r.children[i].1)")
        }
        return str
    }
}

class ViewController: UIViewController {
    private let provider = MoyaProvider<APIManager>()
    override func viewDidLoad() {
        super.viewDidLoad()
        let test = MyTestClass()
        let test1 = TestClass()
        test1.name = "hans"
        test1.sub.nickName = "Leo666"
        // Do any additional setup after loading the view, typically from a nib.
        let model = DetailViewModel(id: 1)
        provider.rx.request(.getNewsLatest).mapJSON().asObservable().mapObject(type: ListModel.self).subscribe { (model) in
            model.element?.top_stories
           // let m :ListModel = model
            print(model)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


