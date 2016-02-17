//: Playground - noun: a place where people can play

import UIKit

// create functions for existing types
// characters type and iteration
extension String
{
    func dramaticPause() -> String
    {
        var phrase2 = ""
        
        for c in self.characters
        {
            if c == " "
            {
                phrase2 += "      "
            }
            else
            {
                phrase2 += String(c)
            }
        }
        return phrase2
    }
}

// enum
enum TransportationType
{
    case Car
    case Bike
    case train
    case Bus
    case Skateboard
    case defaultType
}

enum ShelterType
{
    case House
    case Apartment
    case Condo
    case Mansion
    case Shack
    case defaultType
}

// class
class Person {
    
    // implicit variable
    var name = ""
    // will set and did set
    var career : String = "" {
        willSet {
            print("About to set career to \(newValue).. This is a big deal")
        }
        didSet {
            print("Just changed career from \(oldValue) to \(self.career).. Hopefully they like their new choice")
        }
    }
    
    // computed variables
    var _age = 0
    var age : Int {
        get {
            return self._age
        }
        set {
            if newValue < 0
            {
                print("You cannot be negative years old!")
            }
            else
            {
                self._age = newValue
            }
        }
    }
    
    // explicit variable
    var transportation: TransportationType = .defaultType
    var shelter: ShelterType = .defaultType
    
    // void function and self in instance methods
    func saySentence(sentence: String)
    {
        // string interpolation
        print("\(self.name) says: \(sentence)")
    }
    
    func saySentenceWithDramaticPause(sentence: String)
    {
        // let is constant
        let phrase = sentence.dramaticPause()
        print("\(self.name) says: \(phrase)")
    }
    
    // variatic parameters, external param names, default parameters, tuples
    func payForMeal(priceList: Int..., withTax tax: Double = 0.08, amountGiven: Double) -> (total: Double, change: Double)
    {
        var total: Double = 0
        var change: Double = 0
        for price in priceList
        {
            total += Double(price)
        }
        total += (total * tax)
        change = amountGiven - total
        return (total, change)
    }
    
    // functions as values, anonymous functions and privacy
    private func performAction(action: (word1: String, word2: String) -> String) -> String
    {
        let result = action(word1: "I'm", word2: " yelling")
        return result
    }
    
    private func yell(word1: String, word2: String) -> String
    {
        return word1.uppercaseString + " " + word2.uppercaseString
    }
    
    func getMad()
    {
        print(performAction(yell))
    }
}

// object members and properties and methods
// object instantiation
var p = Person()
p.name = "Katie"
p.career = "Software Engineer"
p.age = -21
p.age = 21
p.transportation = .Car
p.shelter = .Apartment

p.saySentence("Hi there.")
p.saySentenceWithDramaticPause("Hi there.")

var mealResult = p.payForMeal(1, 1, 6, 7, 3, 8, amountGiven: Double(20))
print("Here is your total: \(mealResult.total)")
print("Here is your change: \(mealResult.change)")

// computed initializer
var needMoreMoney : Bool =
{
    if mealResult.change > 0.0
    {
        return false
    }
    else
    {
        return true
    }
}()
if (needMoreMoney)
{
    print("You did not pay the bill correctly")
}
else
{
    print("Thank you come again")
}

var mealResult2 = p.payForMeal(1, 1, 6, 7, 3, 8, withTax: 0.07, amountGiven: Double(30))
print("Here is your total: \(mealResult2.total)")
print("Here is your change: \(mealResult2.change)")

var needMoreMoney2 : Bool =
{
    if mealResult2.change > 0.0
    {
        return false
    }
    else
    {
        return true
    }
}()
if (needMoreMoney2)
{
    print("You did not pay the bill correctly")
}
else
{
    print("Thank you come again")
}

p.getMad()


// random examples that i couldnt fit into my examples above
// lazy initialization
class RandomExample {
    lazy var people = RandomExample.initialPeople()
    
    class func initialPeople() -> [String] {
        let people = ["John Doe", "Jane Doe" , "Katie Lamkin"]
        return people
    }
}

// inout parameters and range type
func addRange(inout x: Int, range: Range<Int>)
{
    for i in range
    {
        x += i
    }
}

var x = 0
addRange(&x, range: 2...4)

