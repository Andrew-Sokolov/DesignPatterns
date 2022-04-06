//
//  Delegation
//

protocol DisplayDelegate {
    func display(_ text: String)
}

class Printer: DisplayDelegate {
    func display(_ text: String) {
        print(text)
    }
}

class Painter: DisplayDelegate {
    func display(_ text: String) {
        text.forEach { char in
            // Rendering char to image
            // Displaying the image on the screen
        }
    }
}

// Message

class Message {
    private let text: String
    var delegate: DisplayDelegate?
    
    init(_ text: String) {
        self.text = text
    }
    
    func display() {
        delegate?.display(text)
    }
}

// Client

class Client {
    static func run() {
        let printer = Printer()
        let message = Message("Hello, World!")
        message.delegate = printer
        message.display()
    }
}

// Client.run()

// Hello, World!
