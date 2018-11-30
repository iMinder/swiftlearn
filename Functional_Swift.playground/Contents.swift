import UIKit
import Foundation

typealias Distance = Double

struct Position {
    var x: Double
    var y: Double
}

//正常的书写方法
extension Position {
    func inRange(range: Distance) ->Bool {
        return sqrt(x * x + y * y) < range
    }

    func minus(_ p: Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }

    var length: Double {
        return sqrt(x * x + y * y)
    }
}

//定义一种函数类型
typealias Region = (Position) -> Bool

//函数作为返回类型
func circle(_ radius: Distance) -> Region {
    return { point in point.length <= radius }
}

//一个半径为12的园
circle(12)

func circle2(_ radius: Distance, _ center: Position) -> Region {
    return { point in point.minus(center).length <= radius }
}

//圆心为center的园
circle2(12, (10,10))

//生成函数的函数
func shift(_ region: @escaping Region, offset: Position) -> Region {
    return { point in region(point.minus(offset)) }
}

//生成一个半径为10，圆心为（5，5）的园
shift(circle(radius: 10), offset: (5,5))


