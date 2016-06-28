//
//  main.swift
//  Array
//
//  Created by LiChen on 16/5/22.
//  Copyright © 2016年 LiChen. All rights reserved.
//

import Foundation

/**
 *  数组声明方法
 *      第一种 Array<SomeType>
 *      第二种 [SomeType]
 */
// 创建字符串形式的空数组
var myArr = Array<String>()

// 创建整形数组，里面包含 3 个 1
var num = Array<Int>(count : 3, repeatedValue: 1)

print(num)

var arr : [Int] = [1, 2, 3]

// 使用构造方法创建数组
var someInts = [Int]()

var threeDoubles = [Double](count : 3, repeatedValue : 0.0)

var food = ["apple", "orange", "banana", "tomato", "potato"]

print(food)
print(food.count)

var shoppingList = ["Eggs", 123, true]

for item in shoppingList
{
    print(item)
}

for fruit in food
{
    // 遍历出来的 fruit 是 let 类型
}

// 数组的可变性
// 1. append() 方法是在数组结尾添加元素
// food.append（"Vegetables : mushroom"）

// 2. 通过家访添加数组
// food += ["pineappple", "pitaya"]

// 3. food[0...2] = ["a", "b"] // 替换

// 4. insert(atIndex:) 在某个具体索引值之前添加元素
food.insert("Meat", atIndex:0)

// removeAtIndex 移除某一项
food.removeAtIndex(0)

// removeLast 移除数组最后一个
food.removeLast()

// 删除所有元素，参数为是否保留缓冲区，默认是 false
food.removeAll(keepCapacity : false)




