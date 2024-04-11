//
//  RegisterViewController.swift
//  loginViewStduy
//
//  Created by 이수현 on 4/10/24.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - PROPERTIES
    var email:String = ""
    var name:String = ""
    var nickname:String = ""
    var password:String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    var isValidEmail = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isValidName = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isValidNickname = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isValidPassword = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    // textfield
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    // MARK: -ACTIONS
    @objc
    func textFieldEditingChanged(_ sender : UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField :
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case nameTextField :
            self.isValidName = text.count > 2
            self.name = text
        case nicknameTextField :
            self.isValidNickname = text.count > 2
            self.nickname = text
        case passwordTextField :
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing")
        }
        
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        let userInfo = UserInfo(email: self.email, 
                                name: self.name,
                                nickname: self.nickname,
                                password: self.password)
        self.userInfo?(userInfo)
    }
    
    // MARK: -HELPERS
    private func setupTextField(){
        textFields.forEach {
            tf in tf.addTarget(self,
                               action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
//        emailTextField.addTarget(self,
//                                 action: #selector(textFieldEditingChanged(_sender:)), for: .editingChanged)
//        nameTextField.addTarget(self,
//                                 action: #selector(textFieldEditingChanged(_sender:)), for: .editingChanged)
//        nicknameTextField.addTarget(self,
//                                 action: #selector(textFieldEditingChanged(_sender:)), for: .editingChanged)
//        passwordTextField.addTarget(self,
//                                 action: #selector(textFieldEditingChanged(_sender:)), for: .editingChanged)
    }
    
    // 사용자가 입력한 정보 확인 -> UI 업데이트
    private func validateUserInfo(){
        if isValidName
            && isValidEmail
            && isValidNickname
            && isValidPassword{
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebookColor
            }
            
            
        }
        else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.disabledColor
            }
            
        }
            
    }
    private func setupAttribute(){
        //registerButton
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 12)
        let font2 = UIFont.systemFont(ofSize: 12)
        
        let color1 = UIColor.opaqueSeparator
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAtrribute(self.loginButton,
                                                 texts: text1, text2,
                                                 fonts: font1,font2,
                                                 colors: color1,color2)
        
        self.loginButton.setAttributedTitle(attributes, for: .normal
        )
    }

}
// 정규표현식
extension String {
    // 대문자, 소문자, 특수문자, 8자 이상일 때 -> True
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d])(?=.*[~!@#\\$%\\^&\\*])[\\w~!@#\\$%\\^&\\*]{8,}$"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return  passwordValidation.evaluate(with: self)
    }
    // @ 포함, 2글자 이상인지 -> True
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
