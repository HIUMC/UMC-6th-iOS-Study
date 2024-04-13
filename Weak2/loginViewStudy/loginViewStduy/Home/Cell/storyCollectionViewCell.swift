//
//  storyCollectionViewCell.swift
//  loginViewStduy
//
//  Created by 이수현 on 4/13/24.
//

import UIKit

class storyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewBackground: UIView!
    
    @IBOutlet weak var imageViewUserProfileBackground: UIView!
    
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewBackground.layer.cornerRadius = 24
        imageViewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
    }

}
