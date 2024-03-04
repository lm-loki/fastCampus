//
//  ViewController.swift
//  LEDBoard
//
//  Created by 양주원 on 3/4/24.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }
// segue way로 구현하였기때문에 prepare 메서드 사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
        }
    }
    // LEDBoardSettingDelegate 프로토콜 채택시,  SettingViewController에 프로토콜 구현된 메서드를 기입해야한다
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
}

