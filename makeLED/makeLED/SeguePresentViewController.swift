//
//  SeguePresentViewController.swift
//  makeLED
//
//  Created by 양주원 on 3/2/24.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?
            .dismiss(animated: true, completion: nil)
    }
}
