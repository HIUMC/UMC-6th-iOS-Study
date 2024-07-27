//
//  StoryCollectionViewCell.swift
//  CatStaGram
//
//  Created by 이현주 on 5/20/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageViewBackground: UIView!
     
    @IBOutlet weak var viewUserProfileBackground: UIView!
     
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true //원만큼 잘라주기 위해서
        
        // Initialization code
    }
}
