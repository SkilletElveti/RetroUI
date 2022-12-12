//
//  RepTextField.swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/1/22.
//
import UIKit
import Foundation
class RepTextField: UITextField {
    
    var paddingLeft: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }

    var paddingRight: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    func end() {
        self.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
