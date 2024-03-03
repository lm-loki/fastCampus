//
//  CodePresentViewController.swift
//  makeLED
//
//  Created by 양주원 on 3/2/24.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    @IBAction func tap(_ sender: UIButton) {
        self.delegate?.sendData(name: "Gunter")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDelegate? // weak 붙은 이유: delegate패턴 사용시 weak 안붙이면 강한 순환참조로 메모리 누수 발생잇음
}
