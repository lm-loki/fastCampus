//
//  ViewController.swift
//  pomodoro
//
//  Created by 양주원 on 3/27/24.
//

import UIKit

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!

    var duration = 60
    // 타이머 상태
    var timerStatus: TimerStatus = .end
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
    }
    
    func setTimerInfoViewVisible(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configureToggleButton() {
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }

    @IBAction func tapCancelButton(_ sender: UIButton) {
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .start:
            self.timerStatus = .pause
            
        case .end:
            self.timerStatus = .start
            self.setTimerInfoViewVisible(isHidden: false)
            self.datePicker.isHidden = true
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            
        default:
            break
        }
    }
    
}

