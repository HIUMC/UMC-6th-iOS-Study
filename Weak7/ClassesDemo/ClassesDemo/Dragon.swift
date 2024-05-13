
class Dragon: Enemy {
    override func move() {
        print("Fly forwards.")
    }
    override func attack() {
        super.attack()
        print("Spits fire.")
    }
}
