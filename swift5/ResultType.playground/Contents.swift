import UIKit

let queue = DispatchQueue(label: "com.swift.queue")

enum EntryError: Error {
    case OutLimitedError
}

struct AsyncRandomGenerater {
    static let entryLimited = 5
    var count = 0

    mutating func fetchRandomNumber (completion: @escaping (Result<Int, EntryError>) -> Void) {
        let result: Result<Int, EntryError>
        if count < AsyncRandomGenerater.entryLimited {
            result = .success(Int.random(in: 1...100))
        } else {
            result = .failure(.OutLimitedError)
        }
        count += 1
        queue.asyncAfter(deadline: .now() + 2, execute: {
            completion(result)
        })
    }
}

var generator = AsyncRandomGenerater()

(0..<AsyncRandomGenerater.entryLimited + 1).forEach { _ in
    generator.fetchRandomNumber(completion: { result in
        switch result {
        case .success(let number):
            print("num: \(number)")
        case .failure(let error):
            print("failed: \(error)")
        }
    })
}
