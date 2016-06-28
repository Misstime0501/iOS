//
//  main.swift
//  LearnSwift
//
//  Created by LiChen on 5/21/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

import Foundation


/****************************************************************/
/**************************** 变量与常量 **************************/
/****************************************************************/
// 变量 var
// 常量 let
var str = "Hello"

// 一条命令可以跨行
str +=
"Wrold"

/*
 * 标识符必须以字符（包括 Unicode 字符）、下划线（_）、美元符（$）开头，
 * 但不可以以数字开头，不可以包含空格，不能使用关键字，
 * 它的长度没有限制。
 **/

let 🐶 = "dog"

/**
 * class 就是关键字，不能成为标识符，如果非要使用，就如下面代码中的方法进行使用
 * 但强烈不推荐这么做。
 */

var `class` = 3

/**
 *  声明方式
 */

// 声明时直接赋值
var name = "Lucky"

// 声明了类型，未赋值
var age : Int

// 声明时指定类型并赋值
var string : String = "smile"

// 可以一行同时声明多个变量
var a = 20 , b : String , c = "Swift"

print(🐶)
print(a)
print("Her name is \(name)")

/****************************************************************/
/**************************** 数据类型 ***************************/
/****************************************************************/

// Int 整形 和 UInt 无符号整形

// 整形用 Int 就可以了
// 可以增加下划线作为分隔符
let oneMillion = 1_000_000
// 数值前添加额外的值
let price = 0110
// 整形之间类型转换时显性转换
let book1 : Int16 = 100
let book2 : Int32 = 30
let totalPrice = book1 + Int16(book2)

// 特殊浮点型数值， 正无穷大 inf， 负无穷大 -inf， 非数 nan
var w = -4.0 / 0.0
var f = 0.0 / 0.0

var width : Float = 2.1
var height : Double = 3.9

var area1 = width * Float(height)
var area2 = Int(width) * 4

/****************************************************************/
/**************************** 类型别名 ***************************/
/****************************************************************/

typealias Age = UInt
let myAge:Age = 28

/****************************************************************/
/****************************** 元组 *****************************/
/****************************************************************/

var soure = (140, 140, "优秀")

// 赋值必须为所有成员变量赋值
var health : (Int, Int, String)
health = (11, 22, "还好")
NSLog("元组的值等于 = \(health)")
NSLog("指定下标的值 = \(health.0)")


var test : (Int, (Int, String))
test = (10, (20, "不错"))
print("元组中包含元组 输出下 \(test.1.0)")

// 定义元组属性并给定初始值
// k/v 方式声明元组
//var soure2 = (math : 140, English : 140 , Assessment : "A")

var soure2 : (math : Int, English : Int , Assessment : String)
soure2 = (English : 140 , math : 140, Assessment : "A")

print("元组中的 soure2.math = \(soure2.math)")

/****************************************************************/
/**************************** 可选类型 ***************************/
/****************************************************************/

// 声明已知类型的后面紧跟着一个？即代表可选类型，如 Int? 处理值缺失的问题。
var strABC = "Abcderf"
//var num0 : Int = Int(strABC)
var num0 : Int? = Int(strABC)

// 强制解析， 在变量或者常量后面添加 ！ 注意：必须在肯定有值得情况下才能实现
var numA : Int? = 10
var numB : Int? = 20
if numA != nil && numB != nil
{
    let sun = numA! + numB!
}
else
{
    print("numA = nil 或者 numB = nil, 不能强制解析")
}

// 可选绑定 可以用在 if 或者 while ，对可选类型的值进行判断并把值付给一个变量或者常量
var str3 : String! = "Swift"

if var tmp = str3
{
    
}
else
{
    
}

// 隐藏解析可选类型， 在已有类型后面添加！ 如 Int! 适用于被复制之后不会再变为 nil 的值
var str111:String! = "lichen"


