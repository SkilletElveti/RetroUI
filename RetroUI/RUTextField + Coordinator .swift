//
//  RUTextField + Coordinator .swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/15/22.
//

import Foundation
import UIKit
extension RUTextField {
    
    public class Coordinator: NSObject, UITextFieldDelegate {
        
        var kTextfield: RUTextField?
        
        init(kTextfield: RUTextField?) {
            self.kTextfield = kTextfield
        }
        
        public func textFieldShouldClear(_ textField: UITextField) -> Bool {
            guard let kTextfield = kTextfield,
                  let textFieldShouldClearHandler = kTextfield.textFieldShouldClearHandler else { return false }
            return textFieldShouldClearHandler()
        }
        
        @objc func textChanged(_ sender: UITextField) {
            guard let text = sender.text,
                  let kTextfield = kTextfield,
                  let textfieldEditingChangedHandler = kTextfield.textfieldEditingChangedHandler else { return }
            textfieldEditingChangedHandler(text)
        }
        
        public func textFieldDidEndEditing(_ textField: UITextField) {
            guard let kTextfield = kTextfield,
                  let textFieldDidEndEditingHandler = kTextfield.textFieldDidEndEditingHandler else { return }
            textFieldDidEndEditingHandler()
        }
        
        public func textFieldDidBeginEditing(_ textField: UITextField) {
            guard let kTextfield = kTextfield,
                  let textFieldDidBeginEditingHandler = kTextfield.textFieldDidBeginEditingHandler else { return }
            textFieldDidBeginEditingHandler()
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            guard let kTextField = kTextfield,
                  let textFieldShouldReturnHandler = kTextField.textFieldShouldReturnHandler else { return false }
            if textFieldShouldReturnHandler() { textField.resignFirstResponder() ; return true }
            return false
        }
        
        public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            guard let kTextField = kTextfield,
                  let textFieldShouldEndEditingHandler = kTextField.textFieldShouldEndEditingHandler else { return true }
            return textFieldShouldEndEditingHandler()
        }
        
        public func textField(_ textField: UITextField, willPresentEditMenuWith animator: UIEditMenuInteractionAnimating) {
            guard let kTextField = kTextfield,
                  let textfieldWillPresentEditMenuHandler = kTextField.textfieldWillPresentEditMenuHandler else { return
            }
            textfieldWillPresentEditMenuHandler(animator)
            return
        }
        
        public func textField(_ textField: UITextField, willDismissEditMenuWith animator: UIEditMenuInteractionAnimating) {
            guard let kTextField = kTextfield,
                  let textfieldDidDismissEditMenuHandler = kTextField.textfieldDidDismissEditMenuHandler else { return
            }
            textfieldDidDismissEditMenuHandler(animator)
            return
        }
        
        public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let kTextfield = kTextfield,
                  let textfieldshouldChangeCharactersInHandler = kTextfield.textfieldshouldChangeCharactersInHandler else {
                return true
            }
            return textfieldshouldChangeCharactersInHandler(range,string)
        }
        
        public func textFieldDidChangeSelection(_ textField: UITextField) {
            guard let kTextfield = kTextfield,
                  let textFieldDidChangeSelectionHandler = kTextfield.textFieldDidChangeSelectionHandler else {
                return
            }
            textFieldDidChangeSelectionHandler()
        }
    }
    
}
