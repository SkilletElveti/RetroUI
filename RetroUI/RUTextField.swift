//
//  RUTextField.swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/1/22.
//

import Foundation
import SwiftUI
public struct RUTextField: UIViewRepresentable {
    
   public var textFieldShouldClearHandler: (() -> (Bool))?
   public var textFieldDidEndEditingHandler: (() -> ())?
   public var textFieldDidBeginEditingHandler:(() -> ())?
    
   public init(
    textFieldShouldClearHandler: (() -> (Bool))?,
    textFieldDidEndEditingHandler: (() -> ())?,
    textFieldDidBeginEditingHandler: (() -> ())?
    ) {
        self.textFieldShouldClearHandler = textFieldShouldClearHandler
        self.textFieldDidEndEditingHandler = textFieldDidEndEditingHandler
        self.textFieldDidBeginEditingHandler = textFieldDidBeginEditingHandler
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let retroTextField = RepTextField(frame: .zero)
        retroTextField.delegate = context.coordinator
        return retroTextField
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(kTextfield: self)
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

extension RUTextField {
    
    public class Coordinator: NSObject, UITextFieldDelegate {
        
        var kTextfield: RUTextField?
        
        init(kTextfield: RUTextField?) {
            self.kTextfield = kTextfield
        }
        
        public func textFieldShouldClear(_ textField: UITextField) -> Bool {
            guard let kTextfield = kTextfield,
                  let completionHandler = kTextfield.textFieldShouldClearHandler else { return false }
            return completionHandler()
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
            textField.resignFirstResponder()
            return true
        }
    }
    
}

