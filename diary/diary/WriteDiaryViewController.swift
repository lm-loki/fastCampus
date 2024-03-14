//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by 양주원 on 3/13/24.
//

import UIKit

class WriteDiaryViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
    }
    
    private let datePicker = UIDatePicker()
    //datePicker에서 선택된 Date를 저장하는 프로퍼티
    private var diaryDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.confirmButton.isEnabled = false
    }
    
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        // layer 관련된 색상은 cgColor로 설정
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
    
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        //datePicker 한국어로
        self.datePicker.locale = Locale(identifier: "ko_KR")
        // 키보드 대신 datepicker가 나오게 됨
        self.dateTextField.inputView = self.datePicker
    }
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_ :)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_ :)), for: .editingChanged)
    }
    // selector로 호출할 메서드
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy년 MM월 dd일(EEEE)"
        formater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formater.string(from: datePicker.date)
        // 날짜가 변경될때마다 editingChanged 액션을 발생시켜 dateTextFieldDidChange 호출
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    @objc private func titleTextFieldDidChange(_ textfield: UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textfield: UITextField) {
        self.validateInputField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //빈화면 터치시 키보드나 datepicker가 사라짐
        self.view.endEditing(true)
    }
    
    private func validateInputField() {
        // 모든칸이 입력되어있어야 등록 버튼 활성화
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
}

extension WriteDiaryViewController: UITextViewDelegate {
    //textView에 text가 입력될때마다 호출되는 메서드
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
