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
    @State var cornerRadius: CGFloat? = 25
    @State var paddingLeft: CGFloat? = 20
    @State var paddingRight: CGFloat? = 20
    @State var someText: String = ""
    @State var placeholder: String? = "RUTextField Example"
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
            keyboardReturnType: nil,
            borderWidth: $borderWidth,
            borderColor: $borderColor,
            cornerRadius: $cornerRadius,
            paddingLeft: $paddingLeft,
            paddingRight: $paddingRight,
            placeholder: $placeholder
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
