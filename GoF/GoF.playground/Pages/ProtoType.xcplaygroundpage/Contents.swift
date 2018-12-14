//: [Previous](@previous)

/*
 ## 原型模式
 用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。
 OC的copy
 */
protocol Prototype {
    func clone() -> Prototype
}

struct Product: Prototype {
    var title: String
    func copy() -> Prototype {
        return self
    }
    func mutaleCopy() ->Prototype {
        return Product(title: title)
    }
}

//: [Next](@next)
