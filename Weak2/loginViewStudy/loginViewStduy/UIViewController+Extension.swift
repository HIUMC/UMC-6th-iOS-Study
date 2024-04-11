//
//  UIViewController+Extension.swift
//  loginViewStduy
//
//  Created by 이수현 on 4/10/24.
//

import UIKit

extension UIViewController{
    func generateButtonAtrribute(_ button : UIButton,
                                 texts : String...,
                                 fonts : UIFont...,
                                 colors : UIColor...) -> NSMutableAttributedString{
        // UIBUTTON에 입력된 텍스트를 가져옴
        guard let wholeText = button.titleLabel?.text else {fatalError("Button에 텍스트가 없음")}
        // 폰트들
        let customFonts : [UIFont] = fonts
        
        // 설명하고자하는 String의 NSRange
        let customTextRanges = texts.indices.map{ index in (wholeText as NSString).range(of: texts[index])}
        
        // 설명하고자하는 색상들
        let customColors = colors
        
        // Attributes 객체를 생성
        let attributedString = NSMutableAttributedString(string : wholeText)
        
        // 텍스트에 맞는 설정을 추가
        texts.indices.forEach { index in 
            attributedString.addAttribute(.font,
                                          value: customFonts[index],
                                          range: customTextRanges[index])
            attributedString.addAttribute(.foregroundColor, 
                                          value: customColors[index],
                                          range: customTextRanges[index])
        }
        return attributedString
        
    }
}
