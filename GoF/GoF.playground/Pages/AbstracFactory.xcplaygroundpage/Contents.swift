//: [Previous](@previous)

/*:
 ## 抽象工厂
 提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。类图见AbstracFactory.png
 NSNumber调用类初始化方法后，返回的对象是NSCFBoolean和NSBoolean工厂，这两个工厂继承于NSNumber，拥有同样的一些方法，例如intValue和boolValue，在NSNumber的角度看，这就是抽象工厂，同时iOS中把抽象工厂别名为“类簇”
 */
protocol AbstractProductA {

}

protocol AbstractProductB {

}

class ConcreateProductA1: AbstractProductA {

}

class ConcreateProductA2: AbstractProductA {

}

class ConcreateProductB1: AbstractProductB {

}

class ConcreateProductB2: AbstractProductB {

}

protocol AbstractFactory {
    func createProductA() ->AbstractProductA
    func createProductB() ->AbstractProductB
}

class ConcreateFactoryA1: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ConcreateProductA1()
    }
    func createProductB() -> AbstractProductB {
        return ConcreateProductB1()
    }
}

class ConcreateFactoryA2: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ConcreateProductA2()
    }
    func createProductB() -> AbstractProductB {
        return ConcreateProductB2()
    }
}

class Client {
    enum FactoryType {
        case factoryA
        case factoryB
    }
    var factoryType: FactoryType
    private var factory: AbstractFactory {
        switch factoryType {
        case .factoryA:
            return ConcreateFactoryA1()
        case .factoryB
            return ConcreateFactoryA2
    }
        
}
//: [Next](@next)
