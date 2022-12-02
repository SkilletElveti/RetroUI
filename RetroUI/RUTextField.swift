//
//  RUTextField.swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/1/22.
//

import Foundation
import SwiftUI
public struct RUTextField: UIViewRepresentable {
    
    @Binding public var textFieldShouldClearHandler: () -> (Bool)?
    @Binding public var textFieldDidEndEditingHandler: () -> ()?
    @Binding public var textFieldDidBeginEditingHandler: () -> ()?
    
    init(
        _ textFieldShouldClearHandler: Binding<() -> (Bool)?>,
        _ textFiledDidEndEditingHandler: Binding<() -> ()?>,
        _ textFieldDidBeginEditingHandler: Binding<() -> ()?>
    ) {
        self._textFieldShouldClearHandler = textFieldShouldClearHandler
        self._textFieldDidEndEditingHandler = textFiledDidEndEditingHandler
        self._textFieldDidBeginEditingHandler = textFieldDidBeginEditingHandler
    }
    
    public func makeUIView(context: Context) -> some UIView {
        return RepTextField(frame: .zero)
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
            guard let kTextfield = kTextfield else { return false }
            return kTextfield.textFieldShouldClearHandler() ?? false
        }
        
        public func textFieldDidEndEditing(_ textField: UITextField) {
            guard let kTextfield = kTextfield else { return }
            kTextfield.textFieldDidEndEditingHandler()
        }
        
        public func textFieldDidBeginEditing(_ textField: UITextField) {
            guard let kTextfield = kTextfield else { return }
            kTextfield.textFieldDidBeginEditingHandler()
        }
    }
    
}

