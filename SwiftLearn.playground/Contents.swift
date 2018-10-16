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

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() ->Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("hello")
stackOfStrings.push("world")
let top = stackOfStrings.pop()

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

print(stackOfStrings.topItem)

//类型约束，给泛型加上约束，使得泛型遵循某种规定
func findIndex<T: Equatable>(of valueToFind:T, in array: [T])->Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
