//
//  HomeViewController.swift
//  CatStaGram
//
//  Created by 이현주 on 5/20/24.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    var arrayCat : [FeedModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        //Cell마다의 구분선 없애기
        tableview.separatorStyle = .none
         
        //nib파일: cell의 storyboard 파일
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableview.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableview.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")

        let input = FeedAPIInput(limit: 10, page: 0)
        FeedDataManager().feedDataManager(input, self)
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //한 섹션에 몇개의 셀을 넣을 것인가?
        //TableViewCell은 총 11가지 (스토리와 피드)
        return arrayCat.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //어떠한 셀을 보여줄 것인가?
        if indexPath.row == 0 { //indexPath.row: item에 대한 몇번째 cell인가? 첫번째 cell일 경우,
            guard let cell = tableview.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell
                else {
                return UITableViewCell()
            }
            return cell
        } else { //첫번째가 아닌 cell의 경우,
            //dequeueReusableCell: Cell은 재사용을 반복한다.
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()
            }
            //배열의 갯수는 10개이기 때문에 -1만큼 가져옴. 첫번째 cell일 경우는 스토리, 두번째 cell일 경우는 첫번째 index값을 가져와야 함
            if let urlString = arrayCat[indexPath.row - 1].url {
                let url = URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { //첫번째 cell일 경우,
            return 80
        } else { //첫번째가 아닌 cell의 경우,
            return 600
        }
    }
    
    //Cell이 보여질 때
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

//3번째(UICollectionViewDelegateFlowLayout)도 들어가야 하는 이유: CollectionViewCell을 만들었을 때, 뒤에 View가 없기 때문에 반드시 FlowLayout을 설정해줘야 한다.
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { //한 섹션에 몇개의 셀을 넣을 것인가?
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //어떠한 셀을 보여줄 것인가?
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    //CollectionViewCell은 반드시 width와 height를 설정해야 함.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
}

extension HomeViewController {
    //서버와 연결했을 때
    func successAPI(_ result : [FeedModel]) {
        arrayCat = result
        tableview.reloadData()
    }
}
