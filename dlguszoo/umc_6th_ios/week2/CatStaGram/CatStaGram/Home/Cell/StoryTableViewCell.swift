//
//  StoryTableViewCell.swift
//  CatStaGram
//
//  Created by 이현주 on 5/20/24.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    //TableView 혹은 CollectionView를 만들면, Delegate와 DataSource를 self로 설정해두었다. 그러나 화면에 보이는 것은 Home이기 때문에 여기서는 접근이 불가능하다.
    //그래서 함수를 만들어 HomeViewController에서 갖다 쓰자
    func setCollectionViewDataSourceDelegate(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        //옆으로만 스크롤할 수 있게
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        //스토리마다 조금씩 떨어져 있는 것 구현
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //스토리끼리 조금씩 떨어져 있는 것 구현
        flowLayout.minimumLineSpacing = 12
        
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.reloadData() //등록되었을 때, 다시 한번 더 collectionView를 reload
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
