import Foundation

/*
 Write a function that receives two sequences: A and B of integers and returns one sequence C.
 Sequence C should contain all elements from sequence A (maintaining the order) except those, that are present in sequence B p times, where p is a prime number.
 
    // Example
    let arrayA = [2,3,9,2,5,1,3,7,10]
    let arrayB = [2,1,3,4,3,10,6,6,1,7,10,10,10]
    Output    [2, 9, 2, 5, 7, 10]
*/

let arrayA = [2,3,9,2,5,1,3,7,10]
let arrayB = [2,1,3,4,3,10,6,6,1,7,10,10,10]

// MARK: - The Complexity in the worst case is O(n log n)

public func solution(_ baseArray: [Int], _ comparingArray: [Int]) -> [Int] {
    let countDict = getCountDictionary(comparingArray)
    var results = [Int]()
    for (_, item) in baseArray.enumerated() {
        if let repeatingCount = countDict[item] {
            if !isPrime(repeatingCount) {
                results.append(item)
            }
        } else {
            results.append(item)
        }
    }
    return results
}

private func getCountDictionary(_ array: [Int]) -> [Int : Int] {
    var countDict = [Int : Int]()
    array.forEach { item in
        if let lastCount = countDict[item] {
            countDict[item] = lastCount + 1
        } else {
            countDict[item] = 1
        }
    }
    return countDict
}

private func isPrime(_ number: Int) -> Bool {
    guard number > 1 else { return false }
    guard number > 3 else { return true }
    let upperLimit = Int(Double(number).squareRoot())
    for i in 2...upperLimit {
        if number % i == 0 {
            return false
        }
    }
    return true
}

print(solution(arrayA, arrayB))


