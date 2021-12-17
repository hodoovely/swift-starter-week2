//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by quokkaaa
//  Copyright © yagom academy. All rights reserved

import Foundation

let myLottoNumbers: [Int] = [7, 8, 15, 20, 23, 38]
var lottoDrawHistoryRepository = [String: [Int]]()
var presentLottoDrawCounter = 0

@discardableResult func generateLottoNumbers(count: Int) -> Set<Int> {
    var numbers = Set<Int>()
    while numbers.count < count {
        numbers.insert(Int.random(in: 1...45))
    }
    saveLottoDrawNumbers(the: numbers)
    return numbers
}

func compareLottoNumbers(_ numbers: [Int]) -> String {
    let drawLottoNumbers = generateLottoNumbers(count: 6)
    let answerLottoNumbersResult = drawLottoNumbers.intersection(numbers).sorted()
    if answerLottoNumbersResult.count >= 1 {
        return "축하합니다! 겹치는 번호는 \(answerLottoNumbersResult.description.trimmingCharacters(in: ["[","]"])) 입니다!"
    } else {
        return "아쉽지만 겹치는 번호가 없습니다."
    }
}

func saveLottoDrawNumbers(the numbers: Set<Int>) {
    if lottoDrawHistoryRepository.keys.count == 0 {
        lottoDrawHistoryRepository["1회차"] = numbers.sorted()
        presentLottoDrawCounter += 1
    } else {
        lottoDrawHistoryRepository["\(String(presentLottoDrawCounter))"+"회차"] = numbers.sorted()
        presentLottoDrawCounter += 1
    }
}

func repeatGenerateLottoNumber(for howMany: Int) {
    for _ in 0..<howMany {
        generateLottoNumbers(count: 6)
    }
}

func printLottoDrawNumbers(when: Int) {
    if let lottoNumbers = lottoDrawHistoryRepository["\(when)"+"회차"] {
        print("\(when)회차의 로또 당첨 번호는 \(lottoNumbers.description.trimmingCharacters(in: ["[","]"])) 입니다.")
    }
}
generateLottoNumbers(count: 6)
print(lottoDrawHistoryRepository)
repeatGenerateLottoNumber(for: 5)
printLottoDrawNumbers(when: 2)

