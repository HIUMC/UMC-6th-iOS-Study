
class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speeck: String) {
        print("Says:")
    }
    
    override func move() {
        print("Fly forwards")
    }
    
    override func attack() {
        super.attack()
        print("Spits fire, does 10 damage")
    }
}

