//
//  PostCollectionViewCell.swift
//  CatStaGram
//
//  Created by 이현주 on 5/26/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    //이 cell이 Collection View가 생성할 cell임을 알려줌
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //이미지를 외부에서 넣어주기 위해 접근할 함수
    public func setupData() {
        //이미지뷰의 이미지를 업로드한다.
    }
}
