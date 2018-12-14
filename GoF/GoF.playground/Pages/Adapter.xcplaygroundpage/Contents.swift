//: [Previous](@previous)

/*:
 ## Adaper模式
 将一个类的接口转换成客户希望的另外一个接口，可以使得原本因为接口不一致的类可以协同工作。
 可以分为类适配器和对象适配器
 1. 类适配器
 具体类图可以参考资源文件里的class_adapter
 2. 对象适配器
 具体类图可以参考资源文件里的intance_adapter, 好处是更加灵活，能够适配adaptee以及子类的行为
 */
protocol  SomeProtocol {
    func funcA() -> String
}

class Adaptee {
    var someIntValue: Int = 0
    func funcB() ->String {
        return "some value \(someIntValue)"
    }
}

//: 一种类适配器的实现

class ClassAdapter: Adaptee, SomeProtocol{
    func funcA() -> String {
        return funcB()
    }
}

//: 或者使用extension实现
//extension Adaptee: SomeProtocol {
//    func funcA() -> String {
//        return funcB()
//    }
//}

//: 一种对象适配器实现
struct  InstanceAdapter: SomeProtocol {
    private let adaptee: Adaptee

    func funcA() -> String {
        return "\(adaptee.someIntValue)"
    }

    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }
}
//: [Next](@next)
