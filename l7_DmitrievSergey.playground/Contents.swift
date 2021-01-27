import UIKit

enum TicketsErrors: Error {
    case wrongPlace
    case isTaken
}

struct Place {
    var price: Int
    var count: Int
}

class Tickets{
    var flightDirection: String
    var ticketCount: Int
    var place: String = "1a"
    var places = [
        "1a":Place(price: 50, count: 1 ),
        "1b":Place(price: 60, count: 1 )
    ]
    
    init(flightDirection: String, ticketCount: Int) {
        self.flightDirection = flightDirection
        self.ticketCount = ticketCount
    }
    
    func buyTicket () {
        
        guard ticketCount > 1 else {
            return print("На выбранный вами рейс билеты закончились")
        }
        
        ticketCount = ticketCount - 1
        
    }
    
    func choosePlace (myplace: String) throws {
        guard let p = places[myplace] else {
            throw TicketsErrors.wrongPlace
        }
        
        guard p.count > 0 else {
            throw TicketsErrors.isTaken
            //print("Выбранное место занято")
        }
        var newp = p
        newp.count -= 1
        places[myplace] = newp
    }
}

var barsa = Tickets(flightDirection: "Barselona", ticketCount: 40)
barsa.buyTicket()
print(barsa.ticketCount)

do {
    let ch1 = try barsa.choosePlace(myplace: "1a")
} catch let error {
    print(error.localizedDescription)
}

do {
    let ch1 = try barsa.choosePlace(myplace: "1a")
} catch TicketsErrors.isTaken {
    print("Выбранное место занято")
}
catch let error {
    print(error.localizedDescription)
}

print(barsa.places)


