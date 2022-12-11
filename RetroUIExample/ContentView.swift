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
    var body: some View {
        VStack {
            RUTextField(
                textFieldShouldClearHandler:{
                        return false
                },
                textFieldDidEndEditingHandler: {
                    print("RUTextField Ended Editing")
                }, textFieldShouldReturnHandler: {
                    return false
                }, textFieldDidBeginEditingHandler: {
                    print("RUTextField Editing Began")
                }, keyboardReturnType: $keyboardType)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
