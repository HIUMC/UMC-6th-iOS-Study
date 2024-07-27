//
//  ProfileCollectionViewCell.swift
//  CatStaGram
//
//  Created by 이현주 on 5/26/24.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    //이 cell이 Collection View가 생성할 cell임을 알려줌
    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var addProfileImage: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    
    @IBOutlet weak var followerCountLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }
    
    private func setupAttribute() {
        //Image View를 원으로 만들기 - 크기의 반절로 설정
        profileImage.layer.cornerRadius = 88/2
        addProfileImage.layer.cornerRadius = 24/2
        
        //프로필 이미지의 경계 만들기
        //borderline 색상을 줄 때에는 cgColor를 준다
        profileImage.layer.borderColor = UIColor.darkGray.cgColor
        profileImage.layer.borderWidth = 1
        
        //프로필 편집 버튼의 경계 만들기
        editButton.layer.cornerRadius = 5
        //borderline 색상을 줄 때에는 cgColor를 준다
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        //친구 추가 버튼의 경계 만들기
        addFriendButton.layer.cornerRadius = 3
        //borderline 색상을 줄 때에는 cgColor를 준다
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        //게시물, 팔로잉, 팔로우 수 난수로 설정
        [postingCountLabel, followerCountLabel, followingCountLabel]
            .forEach { $0.text = "\(Int.random(in: 0...10))"}
    }

}
