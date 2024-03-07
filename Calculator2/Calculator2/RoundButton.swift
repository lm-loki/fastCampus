//
//  RoundButton.swift
//  Calculator2
//
//  Created by 양주원 on 3/7/24.
//

import UIKit

//스토리보드 상에서 코드의 기능을 옵션으로서 제공하는 역할
@IBDesignable
class RoundButton: UIButton {
    //변경된 UI를 실시간으로 스토리보드에 동기화시켜서 변화된 부분을 확인
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
