//: Playground - noun: a place where people can play

import UIKit


// Optional variables and assignments

var optionalName: String? = "John"
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello \(name)"
}

print (greeting)


// For loops with range

var loop: Int = 0
for i in 0...10 {
    loop += i
}
print (loop)

func addLey(name: String) -> String {
    return name + "ley"
}

print(addLey("Brad"))
print(addLey("Wes"))


// Functions with multiple return types

func whoWins(score1: Int, score2: Int)
             ->(win: String,lose: String) {
    
    if score1 > score2 {
        return ("Team 1 Wins","Team 2 Loses")
    }
    else {
        return ("Team 2 Wins","Team 1 Loses")
    }
}

print(whoWins(45, 32).0)
print(whoWins(45, 32).1)

// Void function
func printThis(text:String) -> Void {
    print (text)
}
// Inferred return type
func returnThis(text:String)-> String {
    return text
}
printThis("Hello")
print (returnThis("World"))

var test = ("Hello","World")
print(test.0)
print (test.1)


