//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 양주원 on 4/6/24.
//

import UIKit

class EnterEmailViewController: UIViewController {
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 30
        
        nextButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.becomeFirstResponder() //첫번째 커서가 emailTextField에 바로 위치시키게끔함
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navigation Bar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
    }
}

extension EnterEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 이메일 입력후 키보드 내려가게하는 코드
        view.endEditing(true)
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //이메일과 비번을 확인후 다음버튼 활성화
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
