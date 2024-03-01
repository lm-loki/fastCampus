//
//  ViewController.swift
//  makeSaying
//
//  Created by 양주원 on 3/1/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    let quotes = [
    Quote(contents: "죽음을 두려워하지말라", name: "벤다이크"),
    Quote(contents: "죽음을 두려워하지말라", name: "벤다이크"),
    Quote(contents: "죽음을 두려워하지말라", name: "벤다이크"),
    Quote(contents: "죽음을 두려워하지말라", name: "벤다이크"),
    Quote(contents: "죽음을 두려워하지말라", name: "벤다이크"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapQuoteGeneratorButton(_ sender: UIButton) {
        let random = Int(arc4random_uniform(5)) // 0 ~ 4 사이의 난수를 생성
        let quote =  quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
    
}

