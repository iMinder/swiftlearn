import Foundation
////: Playground - noun: a place where people can play
//
//import UIKit
//
//var str = "Hello, playground"
//
//// 变量以及常量
//var myVariable = 12
//myVariable = 24
//let myConstant = 50
//
////指定类型，可以让编译器自己指定类型
//let implimentInt = 70
//let implimentFloat = 70.0
//let implimentDouble:Double = 70.000001
//
////强类型转换，其实是创建一个指定类型的实例
//let label = "The width of lable is"
//let width = 100
//let labelWidth = label  + " " + String(width) // \(width)
//
//// Use \() 来把指定类型转化成string类型
//let apples = 3
//let oranges = 4
//let fruitSummery = "I have  \(apples + oranges) pieces of fruit"
//
////
//let quotation = """
//I said "I have \(apples) apples."
//And then I said "I have \(apples + oranges) pieces of fruit."
//"""
//
////数组定义也很简单
//var shoppingList = ["apple", "orange"]
//
//shoppingList[0] = String(123);
//print(shoppingList[0])
//
//var emptyArray = [String]()
//let constantEmptyArray = [Float]()
//
////针对if else的规则
//let individualScores = [75, 43, 103, 87, 12]
//var teamScore = 0
//for score in individualScores {
//    if score > 50 {
//        teamScore += 3
//    } else {
//        teamScore += 1
//    }
//}
//print(teamScore)
//
//
//// optional value
//var strValue :String!
//var strValue1: Optional<String>
//
//var optionalVal :String?
//print(strValue == nil)
//
//var optionalString: String? = "Hello"
//print(optionalString == nil)
//
//var optionalName: String? = "John Appleseed"
//var greeting = "Hello!"
//if let name = optionalName {
//    greeting = "Hello, \(name)"
//}
//
////默认值
//let nickName : String? = nil
//let fulName : String = "John"
//let infor = "Hi \(nickName ?? fulName)"
//
////switch 语句特点
//let vegetable = "red pepper"
//switch vegetable {
//case "celery":
//    print("Add some raisins and make ants on a log.")
//case "cucumber", "watercress":
//    print("That would make a good tea sandwich.")
//case let x where x.hasSuffix("pepper"):
//    print("Is it a spicy \(x)?")
//default:
//    print("Everything tastes good in soup.")
//}
//
////for in 使用
////let interestingNumbers = [
////    "Prime": [2, 3, 5, 7, 11, 13],
////    "Fibonacci": [1, 1, 2, 3, 5, 8],
////    "Square": [1, 4, 9, 16, 25],
////]
////var largest = 0
////for (kind, numbers) in interestingNumbers {
////    for number in numbers {
////        if number > largest {
////            largest = number
////        }
////    }
////}
////print(largest)
//
//
////while执行
//
//var n = 2
//while n < 100 {
//    n *= 2
//}
//print(n)
//
//var m = 50
//repeat {
//    m *= 2
//    print("come in")
//} while m < 100
//print(m)
//
////for
//var total = 0
//for i in 0...4 {
//    total += i
//}
//print(total)
//
////func
//func greet(name: String, today: String)->String {
//    return "Hello \(name) and today is \(today)";
//}
//greet(name : "Hongwuzhao", today:"12.10")
//
//
////func with mutil return values
//func caculateScores(scores:[Int]) ->(min: Int, max:Int, total: Int) {
//    var min = scores[0]
//    var max = scores[0]
//    var total = 0;
//    for score in scores {
//        if min > score {
//            min = score
//        } else if max < score {
//            max = score
//        }
//        total += score;
//    }
//    return (min, max, total)
//}
//
//let statics = caculateScores(scores: [1, 10, 100, 29])
//print(statics.max)
//print(statics.min)
//print(statics.total)
//
//
////nested func
//func returnFifteen() -> Int {
//    var y = 10
//    func add() {
//        y += 5
//    }
//    add()
//    return y
//}
//returnFifteen()
//
////return func
//
//func makeIncrement() ->((Int) -> Int) {
//    func addOne (num: Int) -> Int {
//        return 1 + num
//    }
//    return addOne
//}
//
//var inCrement = makeIncrement();
//inCrement(10)
//
////take another func as argument
//func hasAnyMatches (nums : [Int], condition : ((Int) ->Bool)) ->Bool {
//    for item in nums {
//        if condition(item) {
//            return true;
//        }
//    }
//    return false
//}
//
//func isNegetive(num : Int) -> Bool {
//    return num < 0
//}
//
//hasAnyMatches(nums: [1,2,3,4,-5], condition: isNegetive)
//
//var numbers = [1,2,3,4,5,6]
////numbers.map { (number : Int) -> Int in
////    let result = 3 * number
////    return result
////})
//
////let mappedNumbers = numbers.map({number in 3 * number})
////print(mappedNumbers)
//
125.0/2.4

/*
 * 泛型学习
 */
//struct Stack<Element> {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() ->Element {
//        return items.removeLast()
//    }
//}
//
//var stackOfStrings = Stack<String>()
//stackOfStrings.push("hello")
//stackOfStrings.push("world")
//let top = stackOfStrings.pop()
//
//extension Stack {
//    var topItem: Element? {
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}
//
//print(stackOfStrings.topItem)
//
////类型约束，给泛型加上约束，使得泛型遵循某种规定
//func findIndex<T: Equatable>(of valueToFind:T, in array: [T])->Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}


//typealias使用,顾名思义，创建别名
//1. 简单使用
class myclass {
    typealias Strings = [String]
    var strs : Strings? //是不是感觉没啥卵用
}

//2.错了，typealias可以定义闭包，当一个函数比较长时，此时如果参数中有闭包，写起来是比较痛苦的，此时typealias就发挥作用了,像下面的代码，写起来多痛苦
class MyManager: Codable {
    //...
    //1 . 优化前
//    func foo(success: (_ data: Data, _ message: String, _ status: Int, _ isEnabled: Bool) -> (), failure: (_ error: Error, _ message: String, _ workaround: AnyObject) -> ()) {
//        if isSuccess {
//            success(..., ..., ..., ...)
//        } else {
//            failure(..., ..., ...)
//        }
//    }
//
//    func bar(success: (_ data: Data, _ message: String, _ status: Int, _ isEnabled: Bool) -> (), failure: (_ error: Error, _ message: String, _ workaround: AnyObject) -> ()) {
//        if isSuccess {
//            success(..., ..., ..., ...)
//        } else {
//            failure(..., ..., ...)
//        }
//    }
    
    // ...
    
    //2. 优化后
    typealias Success = (_ data: Data, _ message: String, _ status: Int, _ isEnabled: Bool) -> ()
    typealias Failure = (_ error: Error, _ message: String, _ workaround: AnyObject) -> ()
    
//    func foo(success: Success , failure: Failure) {
//        if isSuccess {
//            success(..., ..., ..., ...)
//        } else {
//            failure(..., ..., ...)
//        }
//    }
//
//    func bar(success: Success, failure: Failure) {
//        if isSuccess {
//            success(..., ..., ..., ...)
//        } else {
//            failure(..., ..., ...)
//        }
//    }
}

//系统库中也广泛使用typealias，比如Codable
//public typealias Codable = Decodable & Encodable

//Self，经常在接口定义中出现，表示实现了这个接口的类型本身以及这个类型的子类
//protocol CopyAble {
//    func copy() ->Self
//}
//
//class MyClass: CopyAble {
//    var num = 1
//    func copy() -> Self {
//        let result = type(of: self).init()
//        result.num = num
//        return result
//    }
//    
//    required init() {
//        
//    }
//}
//
//let object = MyClass()
//object.num = 100
//let copyObject = object.copy()
//object.num = 1
//print("original object \(object.num)")
//print("new object \(copyObject.num)")


// extension metthod
//protocol SomeProtocol{
//    func foo()->Void
//}
//
//extension SomeProtocol{
//    func foo()->Void{
//        // do something
//        print("extension metthod foo")
//    }
//}
//class SomeClassA : NSObject, SomeProtocol{
//}
//
//class SomeClassB: SomeClassA {
//    func foo() {
//        print("class B metthod")
//    }
//}
//let some = SomeClassA()
//some.foo()
//let someB = SomeClassB()
//someB.foo()

//reduce

//extension Array {
//    func reduce<T>(_ initial: T, combine: (T, Element) -> T) ->T {
//        var result = initial
//        for x in self {
//            result = combine(result, x)
//        }
//        return result
//    }
//
//    //用reduce 实现filter
//    func filterUsingReduce(includeElement: (Element) -> Bool) -> [Element] {
//        return reduce([]) { result, x in
//            return includeElement(x) ? result + [x] : result
//        }
//    }
//
//    //用reduce 实现map
//    func mapUsingReduce<T>(tranform: (Element) -> T) -> [T] {
//        return reduce([]){ result, x in
//            return result + [tranform(x)]
//        }
//    }
//}

//let array = [1,2,3,4,5,6,7]
//print(array.reduce(0, { result , x in
//    result + x
//    }))
//print("array self method reduce \(array.reduce(0, combine: +))")
//print(array.reduce(0){ result, x in
//    result + x
//})
//
//array.mapUsingReduce { x in
//    return x * x
//}
//
//let strArr = ["a", "b", "c"]
//let append = strArr.reduce("lalal", combine: +)
//
//let matrix = [[1,2,3],[4,6],[9,0,10]]
//print(matrix.reduce([]){ result , x in
//    result + x
//    }.filterUsingReduce(includeElement: { x in
//        return x > 4
//    }))


//let str = "012ef"
//print(str.utf16)
//print(str.utf16.count)
//
//let s1 = "\u{0041}"
//let s2 = "e\u{0301}"
//
//
//let s1Form = s1.precomposedStringWithCanonicalMapping
//let s2Form = s2.precomposedStringWithCanonicalMapping
//print(s1Form == s2Form)
//
//let s3 = "ff"
//let s4 = "\u{FB00}"
//let s5 = "\u{20FFF}"
//let result = s3.localizedCompare(s4)
//print("\(result == .orderedSame)")
//print(s5.utf8CString)
//let precomposed: Character = "\u{D55C}"
//let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
//
//let test: String = "Hello 😘"
//test.count
//(test as NSString).length

//字符串处理片段
//"hello world".capitalized
//"HELLO worlD".lowercased()q
//[1,2,3,4,5].dropFirst(3)

//lazy 处理，等真正需要的时候才回去遍历，并且在得到满足条件的结果后不再向后计算
//let array = [1,2,3,4,5]
//let value = array.lazy.filter {
//    print("filter \($0)")
//    return $0 > 3
//}
    //.first

//这个和上面得到的结果是一样的，都计算了四次
//let value1 = array.first(where: {
//    print("filter value1 \($0)")
//    return $0 > 3
//})

//进一步理解lazy和非lazy的区别就是，lazy是等用到一个再去计算一个
//no filter
[1,2,3,-3,4,-1].filter({ print("filter one \($0)"); return $0 > 0 }).reduce(0) { (total, ele) -> Int in
    print("count one \(total)")
    return total + ele
}

//with filter
print("\nwith filter\n")
[1,2,3,-3,4,-1].lazy.filter({ print("filter one \($0)"); return $0 > 0 }).reduce(0) { (total, ele) -> Int in
    print("count one \(total)")
    return total + ele
}
