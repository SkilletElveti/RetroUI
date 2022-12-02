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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            RUTextField(
                textFieldShouldClearHandler:{
                        return false
                },
                textFieldDidEndEditingHandler: {
                        print("RUTextField Ended Editing")
                },
                textFieldDidBeginEditingHandler:{
                        print("RUTextField Began Editing")
                })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
