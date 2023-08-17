//
//  main.swift
//  practice
//
//  Created by Seungmin Lee on 8/17/23.
//

import Foundation

// MARK:- Closure

let sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in return a + b }

let sumResult: Int = sum(1, 2)
print(sumResult)

let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in return a + b }

let sub: (Int, Int) -> Int
sub = { (a: Int, b: Int) -> Int in return a - b }

let mul: (Int, Int) -> Int
mul = { (a: Int, b: Int) -> Int in return a * b }

let div: (Int, Int) -> Int
div = { (a: Int, b: Int) -> Int in return a / b }

func calc(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

print(calc(a: 100, b: 20, method: add))
print(calc(a: 100, b: 20, method: sub))
print(calc(a: 100, b: 20, method: mul))
print(calc(a: 100, b: 20, method: div))
