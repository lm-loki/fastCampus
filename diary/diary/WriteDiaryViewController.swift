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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
    }
    
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        // layer 관련된 색상은 cgColor로 설정
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
}

