//
//  LoginViewController.swift
//  loginViewStduy
//
//  Created by 이수현 on 4/10/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func emailTextField(_ sender: UITextField) {
        let text = sender.text ?? "" // Optional
        self.email = text
        
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // 회원가입 정보 전달받음, 그것과 textfield 정보가 일치하면 로그인
        guard let userInfo = self.userInfo else {return}
        if userInfo.email == self.email
            && userInfo.password == self.password{
            self.loginButton.backgroundColor = .facebookColor
            self.loginButton.isEnabled = true
        }
        else{
            self.loginButton.backgroundColor = .disabledColor
            self.loginButton.isEnabled = false
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "testViewController") as! testViewController
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        // 화면전환
        // 1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. 뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        // 3. 화면전환 메소드를 생성해 전환
        // self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        // ARC
        registerViewController.userInfo = { [weak self] (userInfo) in self?.userInfo = userInfo}
    }
    
    private func setupAttribute(){
        //registerButton
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 12)
        let font2 = UIFont.systemFont(ofSize: 12)
        
        let color1 = UIColor.opaqueSeparator
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAtrribute(self.registerButton, 
                                                 texts: text1, text2,
                                                 fonts: font1,font2,
                                                 colors: color1,color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal
        )
    }
    
}
