//
//  main.swift
//  FlowControl
//
//  Created by LiChen on 5/22/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

import Foundation

/****************************************************************/
/*************************** 分支结构 ****************************/
/****************************************************************/

//// if ... else ... 语句
//var age = 30
//if age > 20
//{
//    print("年龄大于 20")
//}
//else
//{
//    print("年龄小于 20")
//}
//
//// swicht ... case ... default ... 语句
//let score = "C"
//switch score
//{
//    case "A", "a":
//        print("优秀")
//    case "B", "b":
//        print("良好")
//    case "C", "c":
//        print("中")
//    case "D", "d":
//        print("合格")
//    case "E", "e":
//        print("不合格")
//    default:
//        print("成绩输入错误")
//}

// fallthrough 语句贯穿
var num = 5
var desc = "\(num)是"
switch num
{
case 2, 3, 5, 7 :
    desc += "质数， 而且还是"
    fallthrough
default:
    desc += "整数"
}
print(desc)

// case 后的条件为元组
var point = (x : 1, y : -1)
switch point
{
case (0, 0):
    print("坐标位于原点")
case (_, 0):
    print("坐标位于 X 轴上")
case (0, _):
    print("坐标位于 Y 轴上")
case (0...Int.max, 0...Int.max):
    print("坐标位于第一象限")
case (0...Int.max, -Int.max...0):
    print("坐标位于第二象限")
case (-Int.max...0, -Int.max...0):
    print("坐标位于第三象限")
case (-Int.max...0, 0...Int.max):
    print("坐标位于第四象限")
default:
    break
}

// 值绑定
switch point {
case (0, 0):
    print("坐标是位于原点")
case (var x, 0):
    print("该坐标位于 X 轴上")
// 条件值绑定
case var (x, y) where x > 0 && y > 0:
    print("(\(x), \(y))位于第一象限")
default:
    break
}

/****************************************************************/
/*************************** 循环结构 ****************************/
/****************************************************************/
// for 循环
//for var count:Int = 0 ; count < 10 ; count += 1
//{
//    print(count)
//}
//
//let base = 3
//let power = 10
//var answer = 1
//for _ in 1...power
//{
//    answer *= base;
//    print(answer)
//}

// 嵌套循环
//outer: for var i = 0; i< 5 ; i+=1
//{
//    for var j = 0; j < 3 ; j+=1
//    {
//        print("i 的值 = \(i), j 的值 = \(j)")
//        if j == 1
//        {
//            break outer
//        }
//    }
//}

