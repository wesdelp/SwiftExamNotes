//: iOS Midterm Study Guide

import UIKit

// Types

let my_name : String  = "Wes"
var my_age  : Int     = 23
var student : Bool    = true
var job     : String?
var car     : String? = "Acura"

// Implicitly Unwrapped, used in class initialization

var classy  : String!

// Forced Unwrapping

if car != nil {
    print("My car is an \(car!).")
}

// Optional Binding

if let job_status = job {
    print("I am a \(job_status)")
} else {
    print("I am looking for a job.")
}

// Tuples

var me = ("Wes", 23)
print("My name is \(me.0) and I am \(me.1) years old.")

var me2 = (name:"Wes", age:"23")
print("My name is \(me2.name) and I am \(me2.age) years old.")

// Functions and External Parameters
// 'age' is external parameter

func birthday(age old_age : Int) -> Int {
    let new_age = old_age + 1
    return new_age
}

if let my_age = Int(me2.age) {
    print("After my birthday I will be \(birthday(age: my_age)).")
} else {
    print("Error! Age could not be converted to Int")
}

// Funtions with inout parameters
// Are mutable, must be passed with &

me2.age = "22"

func fix_age(inout age : Int) -> String {
    ++age
    return "Age fixed."
}

if var my_age = Int(me2.age) {
    print("\(my_age) is wrong. \(fix_age(&my_age)) My age is now \(my_age)")
}

// Value vs. Reference
// Value is where instance is copied when sent to a function etc.
// Reference is where more than one variable may refer to same instance
// To check references referring to same instance, use === and !===

// Structures : Value types, do not allow inheritance or ref counting
// Structures must always be passed by value

struct tv {
    var size = 36
    var brand = "Toshiba"
}

var old_tv = tv()
print(old_tv.size,"inch",old_tv.brand)

old_tv.size = 42
print(old_tv.size,"inch",old_tv.brand)

var new_tv = tv(size:64,brand:"Sony")
print(new_tv.size,"inch",new_tv.brand)

var newer_tv = new_tv

// Classes : Reference types, allow inheritance and type checking
// Can have deinitializers to free up memory
// Reference counting allows more than one reference to a class instance

class fancy_tv {
    var size = 80
    var brand = "Vizio"
    var is_3D = true
}

var expensive_tv = fancy_tv()
print(expensive_tv.size,"inch",expensive_tv.brand)
if expensive_tv.is_3D {print("3D TV")}

var expensive_tv2 = fancy_tv()
expensive_tv === expensive_tv2

var expensive_tv3 = expensive_tv2
expensive_tv2 === expensive_tv3
expensive_tv3.brand = "Sony"
expensive_tv3.brand == expensive_tv2.brand

class init_class {
    var name = ""
    var age = 0
    
    init(theName name:String, age:Int) {
        self.name = name
        self.age = age
    }
    
    func output() {
        print(name,age)
    }
}

var me_class = init_class(theName: "Wes", age: 23)
me_class.output()

// Designated initializers are called from immediate superclass
// Covenience initializers must call an initializer from the same class
// Ultimately up the chain a designated initializer will be called

// Self specifies instance and can intepretted 
// If parameter is same name, must use self as parameter takes precedence

// Super causes search for method to begin in super class, not in current class

// Type Casting

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie : MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song : MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let mediaLibrary = [
    Movie(name: "Inception", director: "Christopher Nolan"),
    Song(name: "American Idiot", artist: "Green Day"),
    Song(name: "Piano Man", artist: "Billy Joel"),
]

for item in mediaLibrary {
    if item is Movie {
        print("Movie Found!")
    }
    if item is Song {
        print("Song Found!")
    }
}

// Downcasting. Similar to unwrapping, as! is forced, as? when unsure if downcast will succeed

for item in mediaLibrary {
    if let movie = item as? Movie {
        print("\(movie.name) directed by \(movie.director)")
    }
    else {
        let song = item as! Song
        print("\(song.name) produced by \(song.artist)")
    }
}

// Inheritance is when a child class derives methods from it's parent class
// Methods can be overriden for child class functionality
// If method is not found, the super class is searched
// If the top of the chain is reached and the method isn't found, an error occurs
// iOS examples include views/super views
// Ability to inherit and override known as polymorphism

// Automatic Reference Counting manages memory by keeping track of instances
// When nothing is referring to an instance, it is deallocated
// Strong relationships keep instances from being deallocated
// If two strong instances are linked, it creates a strong cycle and memory can be leaked
// The 'weak' keyword prevents a cycle from happening and allows ARC to deallocate
// The 'deinit' keyword can specify what to do as an instance is being deallocated

// Autolayout allows developer to set up a view by specifying relationships between elements
// Allows for dynamic interface that responds to different screen sizes and orientations
// Constraints have the form y = mx + b. y and x are attributes of view, m and b are floating points
// button.left = container.left + 20 ... y = button.layout, x = container.left, b = 20
// Intrinsic content size elements let system determine size based on the elements content

// MVC Design Pattern. Object mediates between the data and the display (changing one has minimal effect on other)
// Consequences: model object representing data, view object representing display, controller object in between
// Interaction with view -> Request to controller -> Request to data model
// Data model changed -> Controller informed, formatted for presentation -> View(s) updated

// Target-Action Design Pattern. Allows object to send a message to another object at an arbitrary time
// Specify in sender an object to send to (target), and the message to be sent (action)

// IBOutlets and IBActions create connections between storyboard elements and data objects
// IBOutlet extablishes a connections between data object and storyboard/nib object
// IBAction extablishes a connections between storyboard/nib object and data object

// A view object is an instance of UIView or a subclass of UIView
// The root of the view hierarchy is the application window. Views handle events, such as touches
// The UIView class itself is a subclass of UIResponder. At runtime a view handles rendering and events
// Every iOS device has a UIWindow view subclass that is the top-level view
// Views can contain other views, known as subviews (UIButton, UILabel, etc.)
// When there is a change, the view hierarchy is redrawn

// View Properties:
// Frame (CGRect) - defines the size and position of a view as is relative to it's superview
// Bounds (CGRect) - interior coordinate system when drawing the contents of the view, including origin/scaling
// Center (CGPoint) - Specified with respect to superview, adjusts frame accordingly
// BackgroundColor (UI Color) - Specifies background color of view

// Colors

var red = UIColor.redColor()
var color = UIColor(red: 0.1, green: 0.8, blue: 0.0, alpha: 0.5)

// CGRect and Properties (all structs):

// CGPoint (x and y of origin)
var origin = CGPoint(x: 5,y: 5)

// CGSize (width and height of rect)x
var size = CGSize(width: 10,height: 20)

// CGRect (CGPoint and CGSize)
var rect = CGRect(origin: origin, size: size)

// Redrawing. When an event has taken place, the 'run loop' will determine which views need redrawn and will redraw
// Only views that need changed are redrawn to avoid excess redrawing from taking place

// DrawRect method must be provided a CGContext. Before view is sent message to drawRect, a context is created
// This is set as the 'current context'. UIView finds CGRect with bounds method

// The setNeedsDisplay message will cause a view to redraw it's image
// When a subclasses drawable view changes, it will send itself the setNeedsDisplay message
// At each run loop, all views that have sent setNeedsDisplay will be redrawn

// Custom views can be created using UIKit objects such as buttons, labels, etc.
// UIKit objects can draw their own content on the screen

// View controllers are used to manage screens, inherit from UIViewController. Usually one per screen
// View property is a reference to the top-level view the controller manages (UIView)
// ParentViewController property references the container controller if it exists or nil
// Storyboard is a reference to the storyboard the view controller was loaded from

// UITabBarController is a view controller which manages views. Root view is associated with each tab.
// When a tab is selected, the root view assigned to that tab is rendered
// UINavigationController is set as initial view, automatically generates back nav bar with back button
// Modal segues push to a new view based on an action, offer no way to get back
// Unwind segues return the previous view on an action

// A Storyboard is comprised of a number of scenes, each scene represents a view controller and it's views
// Scenes are connected by segue objects which allow transitions between these scenes
// The initial view controller is the starting scene which has no sources from it's 'left'
// This is denoted by the arrow in Storyboard view or 'Is Initial View Controller'

// UITableView is managed by UITableViewController which requires a delegate and a data source
// Data source requires two methods: cellForRowAtIndexPath and numberOfRowsInSection
// Table View Delegate manages selections, reordering, deletions, headers, footers, etc.
// Static tables hold predefined data while Dynamic tables allow for dynamic data of any number of entries

// UIResponder provides an interface for objects that respond to and handle events
// UIResponders have nextResponder, a sequence of objects making up the responder chain
// The first object in this responder chain is known as the 'first responder'
// Top-most view is window, if window's nextResponder does not handle a passed up event, it is discarded

// Views may respond to touch events. Some examples are touchsBegan, touchsMoved, touchsEnded, touchesCancelled
// When a finger touches the screen, a UITouch object is created and sent in message to UIView
// Touch objects are destroyed after touchesEnded method finishes executing

// Controls: UI controls all inherit from UIView. Labels, buttons, sliders, switches, steppers, etc.
// Most do not have an outlet to reference the control, labels are an exception
// Usually controls are provided with an action to define what to do upon interaction


