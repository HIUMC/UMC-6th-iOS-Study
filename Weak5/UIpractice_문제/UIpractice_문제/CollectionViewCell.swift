//
//  CollectionViewCell.swift
//  UIpractice_문제
//
//  Created by Dongwan Ryoo on 2023/07/03.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    //MARK: - UI ProPerties
    //구매 목록 텍스트
    lazy var text: UILabel = {
        let label = UILabel()
        label.text = "구매 목록입니다."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()

    //MARK: - Define Method

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSet()
        viewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    //전체 view 관리
    func viewSet() {
        self.addSubview(text)
    }
    
    //전체 오토레이아웃 관리
    func viewConstraint() {
        text.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
