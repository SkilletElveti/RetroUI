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
    public var textFieldShouldEndEditingHandler: (() -> (Bool))?
    public var textfieldEditingChangedHandler: ((String) -> ())?
    public var textfieldWillPresentEditMenuHandler: ((UIEditMenuInteractionAnimating) -> ())?
    public var textfieldDidDismissEditMenuHandler: ((UIEditMenuInteractionAnimating) -> ())?
    
    @Binding public var keyboardReturnType: UIReturnKeyType?
    @Binding public var borderWidth: CGFloat?
    @Binding public var borderColor: CGColor?
    @Binding public var cornerRadius: CGFloat?
    @Binding public var cornerCurve: CALayerCornerCurve?
    @Binding public var paddingLeft: CGFloat?
    @Binding public var paddingRight: CGFloat?
    @Binding public var placeholder: String?
    @Binding public var borderStyle: UITextField.BorderStyle?
    @Binding public var clearButtonFlag: Bool?
    
    public init (
        
        textFieldShouldClearHandler: (() -> (Bool))?,
        textFieldDidEndEditingHandler: (() -> ())?,
        textFieldShouldReturnHandler: (() -> (Bool))?,
        textFieldDidBeginEditingHandler: (() -> ())?,
        textFieldShouldEndEditingHandler: (() -> (Bool))?,
        textfieldEditingChangedHandler: ((String?) -> ())?,
        textfieldWillPresentEditMenuHandler:  ((UIEditMenuInteractionAnimating) -> ())?,
        textfieldDidDismissEditMenuHandler:  ((UIEditMenuInteractionAnimating) -> ())?,
        
        keyboardReturnType: Binding<UIReturnKeyType?>?,
        borderWidth: Binding<CGFloat?>?,
        borderColor: Binding<CGColor?>?,
        cornerRadius: Binding<CGFloat?>?,
        cornerCurve: Binding<CALayerCornerCurve?>?,
        paddingLeft: Binding<CGFloat?>?,
        paddingRight: Binding<CGFloat?>?,
        placeholder: Binding<String?>?,
        borderStyle: Binding<UITextField.BorderStyle?>?,
        clearButtonFlag: Binding<Bool?>?
        
    ) {
        
        self.textFieldShouldClearHandler = textFieldShouldClearHandler
        self.textFieldDidEndEditingHandler = textFieldDidEndEditingHandler
        self.textFieldDidBeginEditingHandler = textFieldDidBeginEditingHandler
        self.textFieldShouldReturnHandler = textFieldShouldReturnHandler
        self.textFieldShouldEndEditingHandler = textFieldShouldEndEditingHandler
        self.textfieldEditingChangedHandler = textfieldEditingChangedHandler
        
        self.textfieldWillPresentEditMenuHandler = textfieldWillPresentEditMenuHandler
        
        self.textfieldDidDismissEditMenuHandler = textfieldDidDismissEditMenuHandler
        
        self._keyboardReturnType = keyboardReturnType ?? Binding.constant(nil)
        self._borderWidth = borderWidth ?? Binding.constant(nil)
        self._borderColor = borderColor ?? Binding.constant(nil)
        self._cornerRadius = cornerRadius ?? Binding.constant(nil)
        self._paddingLeft = paddingLeft ?? Binding.constant(nil)
        self._paddingRight = paddingRight ?? Binding.constant(nil)
        self._placeholder = placeholder ?? Binding.constant(nil)
        self._cornerCurve = cornerCurve ?? Binding.constant(.continuous)
        self._borderStyle = borderStyle ?? Binding.constant(nil)
        self._clearButtonFlag = clearButtonFlag ?? Binding.constant(nil)
        
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let retroTextField = RepTextField(frame: .zero)
        retroTextField.delegate = context.coordinator
        retroTextField.returnKeyType = keyboardReturnType ?? .default
        retroTextField.layer.borderWidth = borderWidth ?? 0
        if let borderColor = borderColor {
            retroTextField.layer.borderColor = borderColor
        }
        retroTextField.tintColor = .black
        retroTextField.layer.masksToBounds = true
        retroTextField.layer.cornerRadius = cornerRadius ?? 0
        retroTextField.paddingLeft = paddingLeft ?? 0
        retroTextField.paddingRight = paddingRight ?? 0
        retroTextField.addTarget(context.coordinator, action: #selector(context.coordinator.textChanged), for: .editingChanged)
        retroTextField.layer.cornerCurve = cornerCurve ?? .continuous
        if let borderStyle = borderStyle {
            retroTextField.borderStyle = borderStyle
        }
        if let placeholder = placeholder {
            retroTextField.placeholder =  placeholder
        }
        if let clearButtonFlag = clearButtonFlag,
            clearButtonFlag {
            retroTextField.paddingRight = 0
            retroTextField.rightView = nil
            retroTextField.rightViewMode = .never
            retroTextField.initialize()
        }
        
        return retroTextField
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(kTextfield: self)
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let kTextfield = (uiView as? RepTextField) else { return }
        if let paddingLeft = paddingLeft { kTextfield.paddingLeft = paddingLeft }
        if let paddingRight = paddingRight { kTextfield.paddingRight = paddingRight }
        if let placeholder = placeholder { kTextfield.placeholder = placeholder }
        if let keyboardReturnType = keyboardReturnType { kTextfield.returnKeyType = keyboardReturnType }
        if let cornerCurve = cornerCurve { kTextfield.layer.cornerCurve =  cornerCurve }
        if let borderWidth = borderWidth { kTextfield.layer.borderWidth =  borderWidth }
        if let borderColor = borderColor { kTextfield.layer.borderColor = borderColor }
        if let cornerRadius = cornerRadius { kTextfield.layer.cornerRadius = cornerRadius }
        if let borderStyle = borderStyle { kTextfield.borderStyle = borderStyle }
        if let clearButtonFlag = clearButtonFlag,
           clearButtonFlag {
            kTextfield.initialize()
        }
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
    }
    
}

