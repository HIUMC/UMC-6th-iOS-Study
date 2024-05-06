import UIKit

struct ABC {
    var x: Int
    var y: Int
    
    func change() {
        x += 1 //Error : isn't mutable
        y += 1 //Error :
    }
}
