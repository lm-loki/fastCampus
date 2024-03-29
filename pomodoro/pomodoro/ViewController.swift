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
    var timer: DispatchSourceTimer?
    //현재 카운트다운 되고잇는 시간을 초로 저장하는 프로퍼티
    var currentSeconds = 0
    
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
    
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating: 1)
            self.timer?.setEventHandler(handler: { [weak self] in
                self?.currentSeconds -= 1
                debugPrint(self?.currentSeconds)
                
                if self?.currentSeconds ?? 0 <= 0 {
                    //타이머 종료
                    self?.stopTimer()
                }
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false
        self.setTimerInfoViewVisible(isHidden: true)
        self.datePicker.isHidden = false
        self.toggleButton.isSelected = false
        self.timer?.cancel()
        self.timer = nil
    }

    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            self.stopTimer()
            
        default:
            break
            
        }
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
            // 타이머 돌고있을때 일시정지 버튼 눌렀을때
            self.timer?.suspend()
            
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
            self.setTimerInfoViewVisible(isHidden: false)
            self.datePicker.isHidden = true
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
            
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true
            // 일시정지일때 다시시작버튼 눌럿을때
            self.timer?.resume()
        }
    }
    
}

