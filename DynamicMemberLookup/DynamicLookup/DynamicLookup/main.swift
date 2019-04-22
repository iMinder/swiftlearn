//
//  main.swift
//  DynamicLookup
//
//  Created by hongwuzhao on 1/22/19.
//  Copyright © 2019 tencent. All rights reserved.
//

import Foundation
import <#module#>
func contain(set: Set<String>) -> Bool {
    return set.contains("hello")
}
func arrayContain(array: [String]) ->Bool {
    return array.contains("hello")
}

let dynamicStruct = DynamicStruct()
//print(dynamicStruct.user as String)
//print(dynamicStruct.city as String)
//print(dynamicStruct.noValue as String)
//print(dynamicStruct.age as Int)
//print(dynamicStruct.birthdates as Int)

//let set: Set<String> = ["test", "hello", "world"]
//
//print (contain(set: set))
//arrayContain(array: set)

//dynamiccallable
dynamicStruct(1,2,3)
