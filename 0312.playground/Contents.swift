import UIKit

var str = "Hello, playground"

enum RocketError: Error {
    case insufficientFuel
    case insufficientAstronauts(needed: Int)
    case unknownError
}

func startRocketIntoTheSpace(with isFuelOnBoard: Bool, and astronauts: Int) throws {
    guard astronauts > 4 else { throw RocketError.insufficientAstronauts(needed: 5 - astronauts) }
    guard isFuelOnBoard else { throw RocketError.insufficientFuel }
    
    print("Go")
}

do {
    try startRocketIntoTheSpace(with: true, and: 6)
    
} catch RocketError.insufficientAstronauts(let needed) {
    print("nedd more astronavts")
} catch RocketError.insufficientFuel {
    print("Need fuel")
} catch {
    print("Alarm! error")
}

do {
    try startRocketIntoTheSpace(with: false, and: 3)
} catch {
    print(error)
}


enum ValidationError: Error {
    case shortName
    case longName
    case anotherSymbols(Character)
}

func validate(username: String) throws {
    guard username.count < 16 else { throw ValidationError.longName }
    guard username.count > 3 else { throw ValidationError.shortName }
    

    try Array(username).forEach {
        guard $0.isLetter else { throw ValidationError.anotherSymbols($0)
            
    }
}
     
    print("All good")
}



extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .shortName:
            return NSLocalizedString("Too short", comment: "")
        case .longName:
            return NSLocalizedString("Too long", comment: "")
            
        case .anotherSymbols(let symbol):
            let formatString = NSLocalizedString("Your name should No characters '%@'", comment: "")
            return String(format: formatString, String(symbol))
        }
    }
}

do {
try validate(username: "Ig7")
} catch {
    print(error)
    print(error.localizedDescription)
    
}

func validate(username: String, then handler: @escaping (ValidationError?) -> Void) {
    do {
        try validate(username: username)
        handler(nil)
    } catch {
        handler(error as? ValidationError)
    }
}


class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) initizing")
    }
    deinit {
        print("\(name) deinitizing")
    }
}
var reference1: Person?
var refefence2: Person?
var reference3: Person?

reference1 = Person(name: "John")


class Student {
    func goAway() {
        print("Sudent absent")
    }
}
class Teacher {
    func useJournal() {}
}

let array: [AnyObject] = [Student(), Teacher()]

for object in array {
    if let teacher = object as? Teacher {
        print("Вот и учитель")
        print(teacher)
        teacher.useJournal()
    }
    if let student = object as? Student {
        student.goAway()
    }
}
