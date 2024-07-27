//
//  FeedTableViewCell.swift
//  CatStaGram
//
//  Created by 이현주 on 5/20/24.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var buttonIsHeart: UIButton!
    @IBOutlet weak var buttonIsBookMark: UIButton!
    @IBOutlet weak var labelHowManyLike: UILabel!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    //좋아요, 북마크 누르기
    @IBAction func actionIsHeart(_ sender: UIButton) {
        if buttonIsHeart.isSelected {
            buttonIsHeart.isSelected = false
        } else {
            buttonIsHeart.isSelected = true
        }
    }
    @IBAction func actionIsBookMark(_ sender: UIButton) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected =  false
        } else {
            buttonIsBookMark.isSelected = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //프사 둥글게
        imageViewUserProfile.layer.cornerRadius = 12.5
        imageViewUserProfile.clipsToBounds = true
        imageViewMyProfile.layer.cornerRadius = 12.5
        imageViewMyProfile.clipsToBounds = true
        
        //아이디는 bold로, 피트 내용은 regular로
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3)) //어디부터 어디까지 폰트를 유지할 것인가?
        
        labelFeed.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
