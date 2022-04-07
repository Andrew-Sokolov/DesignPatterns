//
//  Lazy Initialization
//

struct Rectangle {
    let width: Int
    let height: Int
    
    init(width: Int, height: Int) {
        print("Initialization of the rectangle.")
        self.width = width
        self.height = height
    }
    
    private(set) lazy var area: Int = {
        print("Lazy Initialization of the area.")
        return width * height
    }()
}

// Client

class Client {
    static func run() {
        var rectangle = Rectangle(width: 12, height: 34)
        print("Rectangle: width = \(rectangle.width), height = \(rectangle.height).")
        print("Rectangle: area = \(rectangle.area).")
    }
}

// Client.run()

// Initialization of the rectangle.
// Rectangle: width = 12, height = 34.
// Lazy Initialization of the area.
// Rectangle: area = 408.
