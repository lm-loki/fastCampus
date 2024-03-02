//
//  SequePushViewController.swift
//  makeLED
//
//  Created by 양주원 on 3/2/24.
//

import UIKit

class SequePushViewController: UIViewController {

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?
            .popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
