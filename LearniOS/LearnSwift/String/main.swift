//
//  main.swift
//  String
//
//  Created by LiChen on 16/5/22.
//  Copyright © 2016年 LiChen. All rights reserved.
//

import Foundation

/****************************************************************/
/***************************** 字符 ******************************/
/****************************************************************/
/*
 1. 单个字符来制定字符串常量， 如 ："A" , "9"
 2. 转义字符表示特殊字符常量， 如 ："\n" , "\t"
 3. 使用 \u{n} 的 Unicode 形式， n 代表一个 1 ~ 8 位的十六进制数
 4. 必须用双引号包起来
 5. Swift 中的每一个字符代表一个可扩展字母集
 */
//var s:Character = "美"
//var quote1 = "\'"
//var quote2 = "\u{22}"
//print("quote1 = \(quote1)   quote2 = \(quote2)")

// 使用 Unicode 形式定义的四个字符
var diamond:Character = "\u{2666}"
var heart:Character = "\u{2663}"
var club:Character = "\u{2665}"
var spade:Character = "\u{2660}"
print("diamond = \(diamond)   heart = \(heart)   club = \(club)   spade = \(spade)")

/****************************************************************/
/**************************** 字符串 *****************************/
/****************************************************************/
// 创建
var str1 = "名字"
// 使用构造器来创建字符串
var str2 = String()
// 创建多个重复字符的字符串
var str3 = String(count:4, repeatedValue:Character("a"))
// 判断字符串是否为 nil
print(str3.isEmpty)

// 字符串拼接
var str4 = str1 + "叫什么"
str1 += "呢"
print(str3)

let char:Character = "?"
str1.append(char)
print(str1)
// 获取字符串长度
print("str3 has \(str3.characters.count) characters")

/**
 *  Swift 中的字符串是否可以修改仅通过定义的是变量还是常亮来决定的
 */

// 字符串比较
let quotation = "Same String ."
let sameQuotation = "Same String ."
if quotation == sameQuotation
{
    print("两个字符创相同")
}

// 检查字符串是否拥有特定的前缀或后缀
var food = ["Fruits : apple", "Fruits : orange", "Fruits : banana", "Vegetables : tomato", "Vegetables : potato"]
for fru in food
{
    if fru.hasPrefix("Fruits")
    {
        print(fru)
    }
    if fru.hasSuffix("o")
    {
        print(fru)
    }
}


