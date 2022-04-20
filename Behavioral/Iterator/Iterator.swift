//
//  Iterator
//

struct NumbersCollection: Sequence {
    fileprivate lazy var items = [Int]()
    
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    func makeIterator() -> FirstEvenLastOddIterator {
        FirstEvenLastOddIterator(self)
    }
}

struct FirstEvenLastOddIterator: IteratorProtocol {
    private var collection: NumbersCollection
    private var count = 0
    private var index = 0
    
    init(_ collection: NumbersCollection) {
        self.collection = collection
    }
    
    mutating func next() -> Int? {
        guard count < collection.items.count else {
            return nil
        }
        
        defer {
            count += 1
            index += 2
            
            if index >= collection.items.count {
                index = 1
            }
        }
        
        return collection.items[index]
    }
}

// Client

class Client {
    static func run() {
        var numbers = NumbersCollection()
        
        for digit in 0...9 {
            numbers.append(digit)
        }
        
        for number in numbers {
            print(number)
        }
    }
}

// Client.run()

// 0
// 2
// 4
// 6
// 8
// 1
// 3
// 5
// 7
// 9
