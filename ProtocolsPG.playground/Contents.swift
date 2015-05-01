//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol FullyName {
    var fullName: String {get}
    //failing init to verify that a name or string type was passed
    init(name nameProvided: String)
}

protocol RandomNumberGenerator {
    func random() -> Double
}

protocol Togglable {
    mutating func toggle()
}
println("Before implement classes")

class LinearCongruentialGenerator: NSObject, RandomNumberGenerator, FullyName {
    let fullName : String
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }

    required init(name nameProvided: String) {
        fullName = nameProvided
        //just to trigger the failure
//        if nameProvided.isEmpty { return nil }
    }
}

let generator = LinearCongruentialGenerator(name: "Pepe Cortizona")

//if generator == nil {
//    println("Anonimous generator could not be initialized")
//}

println("Here's a random number: \(generator.random())")
//println("Here's a random number: \(generator!.random())")
println("\(generator.fullName)")

class Dice {
    let sides : Int
    let generator : RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides) + 1)
    }
}
//
let dice = Dice(sides: 6, generator: generator)
println((dice.roll()))

//enum OnOffSwitch: Togglable {
//    case Off, On
//    mutating func toggle() {
//        switch self {
//        case Off:
//            self = On
//            println("On")
//            //TODO: break are available? should be.
//        case On:
//            self = Off
//            println("Off")
//        }
//    }
//}
//
//var lightSwitch = OnOffSwitch.Off
//lightSwitch.toggle()
////TODO: how to identify the state of the switch?
//lightSwitch != OnOffSwitch.On ? println("On") : println("Off")

