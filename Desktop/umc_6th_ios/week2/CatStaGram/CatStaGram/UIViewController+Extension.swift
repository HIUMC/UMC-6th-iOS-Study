//
//  UIViewController+Extension.swift
//  CatStaGram
//
//  Created by 이현주 on 5/20/24.
//

import UIKit

extension UIViewController {
    func generateButtonAttribute(_ button: UIButton, texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString { //...은 파라미터를 복수로 받을 수 있다는 문법. NSMutableAttributedString: 속성이 적용된 형태의 String으로 반환
        
        //UIButton에 입력된 text를 가져온다
        guard let wholeText = button.titleLabel?.text else {fatalError("버튼에 텍스트가 없음.")}
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        //설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        //설정하고자 하는 색상들
        let customColors = colors
        
        //attribute 객체를 생성  
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        //텍스트에 맞는 설정을 추가
        texts.indices.forEach { index in
            attributedString.addAttribute(.font, value: customFonts[index], range: customTextsRanges[index])
            attributedString.addAttribute(.foregroundColor, value: customColors[index], range: customTextsRanges[index])
        }
        return attributedString
    }
}
