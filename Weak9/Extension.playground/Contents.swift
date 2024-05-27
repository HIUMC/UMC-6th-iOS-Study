import UIKit

//extension Double {
//    func round(to places: Int)->Double {
//        let precisionNum = pow(10,Double(places))
//        var n = self
//        n = n * precisionNum
//        n.round()
//        n = n / precisionNum
//        return n
//    }
//}
//
//var myDouble = 3.141592
//
//let myRoundDouble = String(format: "%1.f", myDouble)
//
//myDouble.round(to: 3)

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red
button.layer.cornerRadius = 25
button.clipsToBounds = true

extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
        
    }
}
