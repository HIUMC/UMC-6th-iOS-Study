//
//  ProfileViewController.swift
//  CatStaGram
//
//  Created by 이현주 on 5/26/24.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

    }
    //MARK: - Actions
    
    
    
    //MARK: - Helpers
    private func setupCollectionView() {
        //Collection View delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        //ProfileCollectionViewCell 등록
        profileCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        //PostCollectionViewCell 등록
        profileCollectionView.register(
            UINib(nibName: "PostCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//프로토콜 채택
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //섹션의 갯수 (Profile, Post)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //Cell의 갯수 - 섹션이 2개 이상이면, Cell의 갯수를 조건문으로 다르게
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: //Profile
            return 1
        default: //Post
            return 24
        }
    }
    
    //Cell 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section {
        case 0: //Profile
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as?
            //몇번째 cell인지는 indePath가 결정, typeCasting
            ProfileCollectionViewCell else {
            // return UICollectionViewCell() -> 일반적인 cell모양 호출
                fatalError("cell 타입 캐스팅 실패...") //crash 해버리기
            }
            return cell
        default: //Post
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as?
            //몇번째 cell인지는 indePath가 결정, typeCasting
            PostCollectionViewCell else {
            // return UICollectionViewCell() -> 일반적인 cell모양 호출
                fatalError("cell 타입 캐스팅 실패...") //crash 해버리기
            }
            //cell.setupData() // <-- 데이터 전달
            return cell
        }
    }
}

//Cell 사이즈 조절
//Collection View의 사이즈 조절은 Table View와 다르게 추가로 delegate를 하나 더 채택해야 함
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section {
        case 0: //Profle
            return CGSize(
                width: collectionView.frame.width,
                height: CGFloat(159))
        default: //Post
            //한 변의 길이 (한줄에 있는 변 3개 길이는 collectionView 가로에서 여백의 합을 뺀 것과 같다.)
            let side = CGFloat((collectionView.frame.width/3) - 4/3)
            return CGSize(
                width: side,
                height: side)
        }
    }
    
    //item간의 여백 (|)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
    //line간의 여백 (-)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}
