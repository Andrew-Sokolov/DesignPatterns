//
//  Observer
//

protocol PriceObserver: AnyObject {
    func priceReduced(from oldPrice: Int, to newPrice: Int)
}

class MacBookProPriceObserver: PriceObserver {
    func priceReduced(from oldPrice: Int, to newPrice: Int) {
        let discount = ((oldPrice - newPrice) * 100) / oldPrice
        print("New price \(newPrice)$. Discount \(discount)%. " + (discount >= 25 ? "I buy." : "I don’t buy."))
    }
}

// Observable

protocol PriceObservable {
    func add(observer: PriceObserver)
    func remove(observer: PriceObserver)
    func notify(about newPrice: Int)
}

class MacBookProPriceObservable: PriceObservable {
    private lazy var observers = [PriceObserver]()
    private var price: Int
    
    init(price: Int) {
        self.price = price
    }
    
    func add(observer: PriceObserver) {
        observers.append(observer)
    }
    
    func remove(observer: PriceObserver) {
        while let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    func notify(about newPrice: Int) {
        let oldPrice = price
        price = newPrice
        
        observers.forEach {
            $0.priceReduced(from: oldPrice, to: newPrice)
        }
    }
}

// Client

class Client {
    static func run() {
        let shop = MacBookProPriceObservable(price: 2399)
        let me = MacBookProPriceObserver()
        shop.add(observer: me)
        
        let newPrice = 1798
        shop.notify(about: newPrice)
    }
}

// Client.run()

// New price 1798$. Discount 25%. I buy.
