//
//  UIView+Extension.swift
//  CatStaGram
//
//  Created by 이현주 on 5/20/24.
//

import UIKit

extension UIView { //UIView에 기능확장
    @IBInspectable var cornerRadius: CGFloat { //@IBInspectable: Interface Build에 cornerRadius를 Inspectable로 사용 가능. cornerRadius: 모따기
        get { //값을 읽어올 때: 얼마만큼 둥근지의 수치
            return layer.cornerRadius
        }
        set { //값을 셋팅할 때: 값을 입력받아서 해당 UIView에 적용
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
