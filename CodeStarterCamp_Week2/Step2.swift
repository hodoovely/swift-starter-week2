//
//  Step2.swift
//  CodeStarterCamp_Week2
//
//  Created by junho lee on 2022/06/30.
//

import Foundation

func makeLottoNumbers() -> Set<Int> {
    var lottoNumbers: Set<Int> = Set<Int>()
    while lottoNumbers.count < 6 {
        lottoNumbers.insert(Int.random(in: 1...45))
    }
    return lottoNumbers
}

func findDuplicateNumbersInTwoLottoNumbers(_ first: Set<Int>,
                                           _ second: Set<Int>) -> Set<Int> {
    return first.intersection(second)

}

func printDuplicateNumbers(_ numbers: Set<Int>) {
    if numbers.isEmpty {
        print("아쉽지만 겹치는 번호가 없습니다.")
    } else {
        print("축하합니다! 겹치는 번호는",
              "\(numbers.map { String($0) }.joined(separator: ", "))",
              "입니다!")
    }
}