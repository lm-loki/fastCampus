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
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
    }
    
    private let datePicker = UIDatePicker()
    //datePicker에서 선택된 Date를 저장하는 프로퍼티
    private var diaryDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
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
        // 키보드 대신 datepicker가 나오게 됨
        self.dateTextField.inputView = self.datePicker
    }
    // selector로 호출할 메서드
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy년 MM월 dd일(EEEE)"
        formater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formater.string(from: datePicker.date)
    }
}

