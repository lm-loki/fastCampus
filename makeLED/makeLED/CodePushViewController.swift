//
//  CodePushViewController.swift
//  makeLED
//
//  Created by 양주원 on 3/2/24.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?
            .popViewController(animated: true)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
}
