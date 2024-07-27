//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by 이현주 on 4/29/24.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.isValidEmail() ? .facebook : .disabledbutton //삼항연산자 사용
         
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.count > 2 ? .facebook : .disabledbutton //삼항연산자 사용. 비밀번호를 두글자이상만 쳐도 색상 변경
        
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입 정보를 전달받아서, 그것과 textField 데이터가 일치하면, 로그인이 되어야 함.
        guard let userInfo = self.userInfo else { return } //옵셔널 푸는 방법 -> 데이터가 있으면 풀어서 새로운 변수 userInfo에 저장, 없으면 else문.
        //userInfo에 데이터가 없는 경우, 로그인 버튼이 실행되지 않음.
        if userInfo.email == self.email && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(identifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
        } 
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면전환
        //1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2. 뷰 컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        //3. 화면전환 메소드를 이용해서 화면 전환
//        self.present(registerViewController,animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true) //pushViewController: 다음화면으로  가기. navigationController가 imbeded일 때만 가능
        
        //ARC: swift에서 처리하는 메모리 관리 방법 중 하나 -> 강한 참조: 메모리가 해제됐을 때도 계속 남아있게 되어 메모리 낭비/ 약한 참조: ARC를 낮춰줌으로써 메모리가 해제됐을 때도 밑의 부분도 같이 해제되도록 처리해준다.
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    private func setupAttribute() {
        //registerButton
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
