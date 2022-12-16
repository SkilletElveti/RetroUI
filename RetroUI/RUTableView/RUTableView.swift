//
//  RUTableView.swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/15/22.
//

import Foundation
import UIKit
import SwiftUI

public struct RUTableView: UIViewRepresentable {
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    public func makeUIView(context: Context) -> some UIView {
        let tableView = RepresentableTableView(frame: .zero, style: .plain)
        return tableView
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }

}
