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
    @State var borderWidth: CGFloat? = 0.7
    @State var borderColor: CGColor? = UIColor.red.cgColor
    @State var cornerRadius: CGFloat? = 15
    var body: some View {
        VStack {
            RUTextField(
                textFieldShouldClearHandler:{
                    return true
                },
                textFieldDidEndEditingHandler: {
                    print("RUTextField Ended Editing")
                }, textFieldShouldReturnHandler: {
                    return false
                }, textFieldDidBeginEditingHandler: {
                    print("RUTextField Editing Began")
                }, keyboardReturnType: nil,
                borderWidth: $borderWidth,
                borderColor: $borderColor,
                cornerRadius: $cornerRadius
            )
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .padding([.horizontal],20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
