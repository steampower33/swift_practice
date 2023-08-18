//
//  property.swift
//  practice
//
//  Created by Seungmin Lee on 8/17/23.
//

import Foundation

// MARK:- Property
func property () -> Void {
    struct Student {
        // 인스턴스 저장 프로퍼티
        var name: String = ""
        var `class`: String = "Swfit"
        var koreanAge: Int = 0
        var westernAge: Int {
            get {
                return koreanAge - 1
            }
            set(inputValue) {
                koreanAge = inputValue + 1
            }
        }
        // 타입 저장 프로퍼티
        static var typeDescription: String = "학생"
        
        /*
        // 인스턴스 메서드
        func selfIntroduce() {
            print("저는 \(self.class)반 \(name)입니다")
        }
         */
        // 읽기전용 인스턴스 연산 프로퍼티
        // 간단히 위의 selfIntroduce() 메서드를 대체할 수 있습니다.
        var selfIntroduction: String {
            get {
                return "저는 \(self.class)반 \(name)입니다"
            }
        }
        
        /*
         // 타입 메서드
         static func selfIntroduce() {
            print("학생타입입니다")
         }
         */
        static var selfIntroduction: String {
            return "학생타입입니다"
        }
    }
    // 타입 연산 프로퍼티 사용
    print(Student.selfIntroduction)
    // 학생타입입니다
    // 인스턴스 생성
    var yagom: Student = Student()
    yagom.koreanAge = 10
    // 인스턴스 저장 프로퍼티 사용
    yagom.name = "yagom"
    print(yagom.name)
    // yagom
    // 인스턴스 연산 프로퍼티 사용
    print(yagom.selfIntroduction)
    // 저는 Swift반 yagom입니다
    print("제 한국나이는 \(yagom.koreanAge)살이고, 미쿸나이는 \(yagom.westernAge)살 입니다.")

}

// MARK:- Property Apply
func property_apply() -> Void {
    struct Money {
        var currencyRate: Double = 1100
        var dollar: Double = 0
        var won: Double {
            get {
                return dollar * currencyRate
            }
            set {
                dollar = newValue / currencyRate
            }
        }
    }
    
    var moneyInMyPocket = Money()
    moneyInMyPocket.won = 11000
    print(moneyInMyPocket.won)
    // 11000.0
    moneyInMyPocket.dollar = 10
    print(moneyInMyPocket.won)
    // 11000.0
}

// MARK:- Property Observer
func propertyObserver () -> Void {
    struct Money {
        // 프로퍼티 감시자 사용
        var currencyRate: Double = 1100 {
            willSet(newRate) {
                print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
            }
            didSet(oldRate){
                print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
            }
        }
        // 프로퍼티 감시자 사용
        var dollar: Double = 0 {
            // willSet의 암시적 매개변수 이름 newValue
            willSet {
                print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
            }
            // didSet의 암시적 매개변수 이름 oldValue
            didSet {
                print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
            }
        }
        // 연산 프로퍼티
        var won: Double {
            get {
                return dollar * currencyRate
            }
            set {
                dollar = newValue / currencyRate
            }
            /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없습니다
            willSet {
            }
            */
        }
    }
    
    var moneyInMyPocket: Money = Money()
    // 환율이 1100.0에서 1150.0으로 변경될 예정입니다
    moneyInMyPocket.currencyRate = 1150
    // 환율이 1100.0에서 1150.0으로 변경되었습니다

    // 0.0달러에서 10.0달러로 변경될 예정입니다
    moneyInMyPocket.dollar = 10
    // 0.0달러에서 10.0달러로 변경되었습니다

    print(moneyInMyPocket.won)
    // 11500.0
}
