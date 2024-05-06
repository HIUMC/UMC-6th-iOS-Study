//
//  ViewController.swift
//  UIpractice
//
//  Created by Dongwan Ryoo on 2023/07/03.
//

import UIKit
import SnapKit

class ViewController: UIViewController{
    //MARK: - UI ProPerties
    
    //1. lazy 키워드는 무엇이며 왜 사용하는가?
    /*
     메모리 사용을 줄이기 위해 최초로 사용되기 전까지 초기값이 계산되지 않는 프로퍼티
     (불필요한 메모리 할당 방지)
     */
    
    //2. 아래에 사용되는 클로저 형태에 대해 설명
    /*
     클로저 : 이름이 없는 함수
            이름이 없기 때문에 호출할 수 없음
     */
    
    //"환영합니다\n이예성님!" UILabel
    lazy var welcomeText: UILabel = {
        let label = UILabel()
        label.text = "환영합니다\n (이름)님!"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        return label
    }()
    
    //이예성님 밑 라인 UIView
    lazy var underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    //구매 목록 표시할  UICollectionView
    lazy var collectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        return view
    }()
    
    //MARK: - Define Method
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSet()
        viewConstraint()
    }
    
    //MARK: - Properties

    
    //MARK: - Set Ui
    //1. Set Ui 전체 메서드 구조 이해 및 설명
    /*
     viewSet() : 전체 뷰 관리(viewController에 배경색, 콜렉션뷰 추가)
     addView() : 전체 뷰에 뷰 추가
     collectionviewSet() :
     viewConstraint() : 오토 레이아웃 관리 함수 모음
     welcomeTextConstraint(), underLineConstraint(), collectionViewConstraint() : 각각의 오토 레이아웃(constraints) 설정
     */
    
    //2. 스냅킷으로 오토레이아웃 잡아보기
    
    //전체 view 관리
    func viewSet() {
        self.view.backgroundColor = .black
        addView()
        collectionviewSet()
    }
    
    // addSubview() 메서드 모음
    func addView() {
        // foreach문을 사용해서 클로저 형태로 작성
        [welcomeText, underLine, collectionview].forEach{view in self.view.addSubview(view)}
    }
    
    //collectionview 관리
    func collectionviewSet(){
        self.collectionview.dataSource = self
        self.collectionview.delegate = self
        self.collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: "IDF")
        self.collectionview.backgroundColor = .black
        self.collectionview.layer.cornerRadius = 10
    }
    
    // 전체 오토레이아웃 관리
    func viewConstraint() {

        welcomeText.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(100)
        }
        
        underLine.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(180)
            make.width.equalTo(self.view.frame.width - 20)
            make.height.equalTo(2)
        }
        
        collectionview.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width - 20)
            make.center.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
}

//MARK: - Extension
//1. extension 키워드는 무엇이며 왜 사용하는가?
/*
 extension은 Swift에서 기존 클래스, 구조체, 열거형, 프로토콜 등을 확장하고 기능을 추가하는 방법
 기존 타입을 수정하지 않고 추가적인 초기화 메서드, 계산 속성, 메서드, 서브 스크립트, 프로토콜 구현 등의 새로운 기능을 추가하기 위해 사용
 */

//2. UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout에 대한 설명
/*
 UICollectionViewDataSource
 : dataSource는 객체가 데이터를 제공하고 해당 데이터를 기반으로 화면에 표시되는 뷰를 구성하는 데 사용됨
 ex) UITableViewDataSource는 UITableView에 표시되는 셀의 수와 셀의 내용을 결정하는 데 사용됨
 
 UICollectionViewDelegate
 : 객체가 다른 객체에게 이벤트를 알리거나 해당 객체가 수행할 작업을 위임하는 데 사용됨
 ex) UITableViewDelegate는 테이블 뷰의 상호 작용을 처리하고 UITableView에서 발생하는 이벤트를 처리함
 
 UICollectionViewDelegateFlowLayout
 : CollectionView 레이아웃의 타입
 해당 CollectionView의 delegate 객체와 함께 동작
 header/footer view 등을 구성할 때 사용
 */

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    // cell 개수 지정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    // cell 등록 및 관련 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IDF", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius =  10
        cell.backgroundColor = .white
        return cell
        
    }
    
    //cell 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionview.frame.width - 10
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
        }
    }
    



