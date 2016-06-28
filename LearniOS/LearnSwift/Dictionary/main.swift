//
//  main.swift
//  Dictionary
//
//  Created by LiChen on 16/5/22.
//  Copyright © 2016年 LiChen. All rights reserved.
//

import Foundation
/**
 声明方式：
 Dictionary <KeyType, ValueType>
 [KeyType : ValueType]
 */

// 声明字典
var dic1 : Dictionary <String , String>
var scores : [String : Int]

// 创建字典
dic1 = Dictionary<String , String>()
// 最小容量为 5
scores = Dictionary<String , Int>(minimumCapacity : 5)

// 空字典
var emptyDic : [String : Double] = [:]
// 判断字典是否为 nil
print(emptyDic.isEmpty)

// 通过常量或者变量决定字典是否可变
var my = ["age" : "28",
          "name" : "LiChen",
          "height" : "180"]

print(my["age"])
print(my["weight"])
my["weight"] = "170"
my["name"] = "帅哥"
print(my)

if my["height"] != nil
{
    print(my["height"])
}

// updateValue(forKey:) 方法在这个键不存在对应值的时候设置值或者在存在时候更新已存在的值
// 这个方法返回更新值之前的原值
if let oldName = my.updateValue("AoTeMan", forKey: "name")
{
    print("原来的值是 ： \(oldName)");
}

for (key, value) in my
{
    print("\(key) : \(value)")
}

// 字典的删除
my.removeAll(keepCapacity: false)

// 根据 key 删除 value
my.removeValueForKey("name")

// 获得全部的 key
let keysArr = [String](my.keys)
// 获得全部的 value
let valuesArr = [String](my.values)


