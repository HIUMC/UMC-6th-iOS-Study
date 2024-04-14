//
//  feedTableViewCell.swift
//  loginViewStduy
//
//  Created by 이수현 on 4/13/24.
//

import UIKit


class feedTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewField: UIImageView!
    @IBOutlet weak var buttonIsHeart: UIButton!
    @IBOutlet weak var buttonIsBookmark: UIButton!
    @IBOutlet weak var labelHowManyLikes: UILabel!
    @IBOutlet weak var userTextField: UILabel!
    @IBOutlet weak var commentProFile: UIImageView!
    
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonIsHeart.isSelected {
            buttonIsHeart.isSelected = false
        }
        else {
            buttonIsHeart.isSelected = true
        }
    }
    
    @IBAction func actionIsBookmark(_ sender: Any) {
        if buttonIsBookmark.isSelected {
            buttonIsBookmark.isSelected = false
        }
        else {
            buttonIsBookmark.isSelected = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewProfile.layer.cornerRadius = 10
        imageViewField.clipsToBounds = true
        commentProFile.layer.cornerRadius = 10
        commentProFile.clipsToBounds = true
        
        let fontsize = UIFont.boldSystemFont(ofSize: 11)
        let attributedStr = NSMutableAttributedString(string: userTextField.text ?? "")
        attributedStr.addAttribute(.font, value: fontsize, range: NSRange.init(location: 0, length: 16))
        userTextField.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
