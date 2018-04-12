//
//  AppDelegate.swift
//  MoyaAndHandyJsonDemo
//
//  Created by hans on 2018/4/12.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import HandyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        struct Person {
            let name: String
            let age: Int
        }
        
        let xiaoMing = Person(name: "XiaoMing", age: 16)
        let r = Mirror(reflecting: xiaoMing) // r 是 MirrorType
        
        print("xiaoMing 是 \(r.displayStyle!)")
        
        print("属性个数:\(r.children.count)")
        
        for i in r.children {
            print(i.label,i.value)
            //if(r.children.startIndex<r.children.endIndex)
            //i.label
            // print("属性名:\(r.children[i].0!)，值:\(r.children[i].1)")
        }
        return true
    }

    
    func test()  {
        
        struct MirrorPerson {
            let name: String
            let age: Int
        }
        func testMirror()  {
            let xiaoMing = MirrorPerson(name: "XiaoMing", age: 16)
            let r = Mirror(reflecting: xiaoMing) // r 是 MirrorType
            
            print("xiaoMing 是 \(r.displayStyle!)")
            
            print("属性个数:\(r.children.count)")
            for i in r.children {
                print(i.label,i.value)
                //if(r.children.startIndex<r.children.endIndex)
                //i.label
               // print("属性名:\(r.children[i].0!)，值:\(r.children[i].1)")
            }
        }
        
//        func valueFrom(object: Any, key: String) -> Any? {
//            let mirror = Mirror(reflecting: object)
//            for i in mirror.children.startIndex ..< mirror.children.endIndex {
//                let (targetKey, targetMirror) = mirror.children[i]
//                if key == targetKey {
//                    return targetMirror
//                }
//            }
//            return nil
//        }

    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

