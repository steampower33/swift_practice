//
//  inheritance.swift
//  practice
//
//  Created by SeungMin Lee on 2023/08/18.
//

import Foundation

// MARK:- Inheritance
func inheritance () -> Void {
    class Person {
        var name: String = ""
        func selfIntroduce() {
            print("저는 \(name)입니다")
        }
        // final 키워드를 사용하여 재정의를 방지할 수 있습니다
        final func sayHello() {
            print("Hello")
        }
        // 타입 메서드
        // 재정의 불가 타입 메서드 - static
        static func typeMethod(){
            print("type method - static")
        }
        // 재정의 가능 타입 메서드 - class
        class func classMethod() {
            print("type method - class")
        }
        // 재정의 가능한 class 메서드라도
        // final 키워드를 사용하면 재정의 할 수 없습니다
        // 메서드 앞의 `static`과 `final class`는 똑같은 역할을 합니다
        final class func finalClassMethod() {
            print("type method - final class")
        }
    }
    
    // Person을 상속받은 Student
    class Student: Person {
        var major: String = ""
        override func selfIntroduce() {
            print("저는 \(name)이고, 전공은 \(major)입니다")
        }
        override class func classMethod() {
            print("overriden type method - class")
        }
        // static을 사용한 타입 메서드는 재정의 할 수 없습니다
        // override static func typeMethod() {  }
        // final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없습니다
        // override func sayHello() {  }
        // override class func finalClassMethod() {  }
    }
    let yagom: Person = Person()
    let hana: Student = Student()
    yagom.name = "yagom"
    hana.name = "hana"
    hana.major = "Swift"
    yagom.selfIntroduce()
    // 저는 yagom입니다
    hana.selfIntroduce()
    // 저는 hana이고, 전공은 Swift입니다
    Person.classMethod()
    // type method - class
    Person.typeMethod()
    // type method - static
    Person.finalClassMethod()
    // type method - final class
    Student.classMethod()
    // overriden type method - class
    Student.typeMethod()
    // type method - static
    Student.finalClassMethod()
    // type method - final class
}
