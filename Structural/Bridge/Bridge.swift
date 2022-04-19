//
//  Bridge
//

// Shapes

enum Color: String {
    case gray
    case red
    case blue
}

protocol Shape {
    var color: Color { get set }
    func draw()
}

class Circle: Shape {
    var color = Color.gray
    
    func draw() {
        print("Draw a \(color.rawValue) circle.")
    }
}

class Square: Shape {
    var color = Color.gray
    
    func draw() {
        print("Draw a \(color.rawValue) square.")
    }
}

// Painters

protocol Painter {
    var shape: Shape { get }
    func drawShape()
}

extension Painter {
    func drawShape() {
        shape.draw()
    }
}

class RedPainter: Painter {
    private(set) var shape: Shape
    
    init(shape: Shape) {
        self.shape = shape
        self.shape.color = .red
    }
}

class BluePainter: Painter {
    private(set) var shape: Shape
    
    init(shape: Shape) {
        self.shape = shape
        self.shape.color = .blue
    }
}

// Client

class Client {
    static func run() {
        let circle = Circle()
        let redPainter = RedPainter(shape: circle)
        redPainter.drawShape()
        
        let square = Square()
        let bluePainter = BluePainter(shape: square)
        bluePainter.drawShape()
    }
}

// Client.run()

// Draw a red circle.
// Draw a blue square.
