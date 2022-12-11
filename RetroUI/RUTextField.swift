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
    public var textFieldShouldReturnHandler: (() -> (Bool))?
    public var textFieldDidBeginEditingHandler:(() -> ())?
    @Binding public var keyboardReturnType: UIReturnKeyType?
    @Binding public var borderWidth: CGFloat?
    @Binding public var borderColor: CGColor?
    @Binding public var cornerRadius: CGFloat?
    
    public init(
        textFieldShouldClearHandler: (() -> (Bool))?,
        textFieldDidEndEditingHandler: (() -> ())?,
        textFieldShouldReturnHandler: (() -> (Bool))?,
        textFieldDidBeginEditingHandler: (() -> ())?,
        keyboardReturnType: Binding<UIReturnKeyType?>?,
        borderWidth: Binding<CGFloat?>?,
        borderColor: Binding<CGColor?>?,
        cornerRadius: Binding<CGFloat?>?
    ) {
        self.textFieldShouldClearHandler = textFieldShouldClearHandler
        self.textFieldDidEndEditingHandler = textFieldDidEndEditingHandler
        self.textFieldDidBeginEditingHandler = textFieldDidBeginEditingHandler
        self.textFieldShouldReturnHandler = textFieldShouldReturnHandler
        
        self._keyboardReturnType = keyboardReturnType ?? Binding.constant(nil)
        self._borderWidth = borderWidth ?? Binding.constant(nil)
        self._borderColor = borderColor ?? Binding.constant(nil)
        self._cornerRadius = cornerRadius ?? Binding.constant(nil)
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let retroTextField = RepTextField(frame: .zero)
        retroTextField.delegate = context.coordinator
        retroTextField.returnKeyType = keyboardReturnType ?? .default
        retroTextField.layer.borderWidth = borderWidth ?? 0
        if let borderColor = borderColor { retroTextField.layer.borderColor = borderColor }
        retroTextField.layer.masksToBounds = true
        retroTextField.layer.cornerRadius = cornerRadius ?? 0
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
            guard let kTextField = kTextfield,
                  let textFieldShouldReturnHandler = kTextField.textFieldShouldReturnHandler else { return false }
            if textFieldShouldReturnHandler() { textField.resignFirstResponder() ; return true }
            return false
        }
    }
    
}

