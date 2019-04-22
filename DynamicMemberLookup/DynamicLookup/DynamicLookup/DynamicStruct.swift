//
//  DynamicStruct.swift
//  DynamicLookup
//
//  Created by hongwuzhao on 1/22/19.
//  Copyright © 2019 tencent. All rights reserved.
//

import Foundation

@dynamicMemberLookup
@dynamicCallable
struct DynamicStruct {
    subscript(dynamicMember member: String) -> String {
        let properties = ["user": "Nick", "city": "Shenzhen"];
        return properties[member, default: "undefined"]
    }

    subscript(dynamicMember member: String) -> Int {
        let properties = ["age": 22, "birthdate": 1990];
        return properties[member, default: -1]
    }

    //Mark: dynamicCallable
    func dynamicallyCall<T: Equatable>(withArguments:[T]) {
        print("the item get is \(withArguments)")
    }
    func dynamicallyCall(withKeywordArguments: KeyValuePairs<String, Int>) {
        print("the value is \(withKeywordArguments.self)")
    }
}
