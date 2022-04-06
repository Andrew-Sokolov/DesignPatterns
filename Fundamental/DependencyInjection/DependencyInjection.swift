//
//  Dependency Injection
//

// Game

protocol Game {
    func start()
}

class Chess: Game {
    func start() {
        print("The game of chess has begun.")
    }
}

// Class without dependency injection

class ChessPlayer {
    private let game: Game
    
    init() {
        game = Chess()
    }
    
    func play() {
        game.start()
    }
}

// Class with dependency injection

class Player {
    private let game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    func play() {
        game.start()
    }
}

// Client

class Client {
    static func run() {
        let chess = Chess()
        let player = Player(game: chess)
        player.play()
    }
}

// Client.run()

// The game of chess has begun.
