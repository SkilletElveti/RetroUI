//
//  ContentView.swift
//  RetroUIExample
//
//  Created by Shubham Kamdi on 12/2/22.
//

import SwiftUI
import RetroUI
import Foundation
struct ContentView: View {
    @State var keyboardType: UIReturnKeyType? = .default
    @State var borderWidth: CGFloat? = 1.7
    @State var borderColor: CGColor? = UIColor.systemPink.cgColor
    @State var cornerRadius: CGFloat? = 20
    @State var paddingLeft: CGFloat? = 20
    @State var paddingRight: CGFloat? = 20
    @State var someText: String = ""
    @State var placeholder: String? = "RUTextField Example"
    @State var corenerCurve: CALayerCornerCurve? = .continuous
    @State var borderStyle: UITextField.BorderStyle? = .roundedRect
    let font: UIFont? = UIFont.systemFont(ofSize: 72)
    @State var clearButtonMode: UITextField.ViewMode? = .unlessEditing
    @State var clearButtonFlag: Bool? = true
    var body: some View {
        VStack {
            Text(someText)
                .padding(.horizontal,20)
            ruTextFieldView()
        }
    }
    
    func ruTextFieldView() -> some View {
        RUTextField (
            textFieldShouldClearHandler:{
                return true
            },
            textFieldDidEndEditingHandler: {
                print("RUTextField Ended Editing")
            },
            textFieldShouldReturnHandler: {
                return true
            },
            textFieldDidBeginEditingHandler: {
                print("RUTextField Editing Began")
            },
            textFieldShouldEndEditingHandler: {
                return true
            },
            textfieldEditingChangedHandler: {
                text in
                someText = text ?? ""
            },
            textfieldWillPresentEditMenuHandler: {
                animator in
                print("textfieldWillPresentEditMenuHandler")
            },
            textfieldDidDismissEditMenuHandler: {
                animtor in
                print("textfieldDidDismissEditMenuHandler")
            },
            textfieldshouldChangeCharactersInHandler: {
                range, string in
                if !CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) {
                    
                    return false
                }
                return true
            },
            keyboardReturnType: nil,
            borderWidth: $borderWidth,
            borderColor: $borderColor,
            cornerRadius: $cornerRadius,
            cornerCurve: $corenerCurve,
            paddingLeft: $paddingLeft,
            paddingRight: $paddingRight,
            placeholder: $placeholder,
            borderStyle: $borderStyle,
            clearButtonFlag: $clearButtonFlag
        )
        .frame(height: 45)
        .frame(maxWidth: .infinity)
        .padding(.horizontal,20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
