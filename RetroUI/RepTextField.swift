//
//  RepTextField.swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/1/22.
//
import UIKit
import Foundation
class RepTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func end() {
        self.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
