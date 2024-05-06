//
//  makeCircle.swift
//  changingVC
//
//  Created by 이수현 on 4/29/24.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{ // 모서리 둥글게 만듬
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

