//
//  ViewController.swift
//  Swift5Demo
//
//  Created by hongwuzhao on 1/30/19.
//  Copyright © 2019 tencent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum EnumDefine {
        //case foo(bar: Int...) error
        case foo(bar: [Int])

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dynamic = DynamicStruct()
        dynamic(1,2,3)
        dynamic(label: 1,2)
        newFeature()
    }

    func newFeature() {
        let id = \Int.self
        var x = 2
        print(x[keyPath: id])
        x[keyPath: id] = 3
        print(x[keyPath: id])

        //
    }
    func baz() ->EnumDefine {
        return .foo(bar: [1,2,3,4])
    }

    func tryReturnOptionalValue() {
        //之前try需要两步才能得到结果
        if let filePath = Bundle.main.path(forResource: "productinfo", ofType: "json"),
            let jsonData = NSData(contentsOfFile: filePath),
            let iapProductInfo = try? JSONSerialization.jsonObject(with: jsonData as Data, options: []) as? [String: Any] {
            print("info is \(iapProductInfo)")
        }
    }
}
