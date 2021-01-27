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
        "1a":Place(price: 50, count: 5 ),
        "1b":Place(price: 60, count: 5 )
    ]
    
    init(flightDirection: String, ticketCount: Int) {
        self.flightDirection = flightDirection
        self.ticketCount = ticketCount
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
        ticketCount = ticketCount - 1
    }
}

var barsa = Tickets(flightDirection: "Barselona", ticketCount: 40)


do {
    let ch1 = try barsa.choosePlace(myplace: "1a")
} catch let error {
    print(error.localizedDescription)
}

do {
    let ch1 = try barsa.choosePlace(myplace: "1b")
} catch TicketsErrors.isTaken {
    print("Выбранное место занято")
}
catch let error {
    print(error.localizedDescription)
}

print(barsa.places)
print(barsa.ticketCount)


