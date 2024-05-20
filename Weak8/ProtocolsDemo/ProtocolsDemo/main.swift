
protocol CanFly {
    func fly() // no curly brases
}

class Bird {
    
    var isFemale = true
    
    func layEggs() {
        if isFemale {
            print("Birds can lay Eggs")
        }
    }
}

class Eagle: Bird, CanFly {
    func fly() {
        print("Eagles can fly")
    }
    
    
    func soar() {
        print("Eagles can soar")
    }
}

class Penguin: Bird {
    func swim() {
        print("Penguins can swim")
    }
}

struct FlyMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    func fly() {
        print("Airplanes can fly")
    }
    
    
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEggs()
myEagle.soar()

let myPenguin = Penguin()
myPenguin.layEggs()
myPenguin.swim()


let myMuseum = FlyMuseum()
myMuseum.flyingDemo(flyingObject: myEagle)
