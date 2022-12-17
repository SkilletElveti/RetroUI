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
    
    public var numberOfRowsInSectionHandler: (()-> (Int))?
    public var tableViewCellForRowAtHandler: (() -> (UITableViewCell))?
    public var tableViewStyleHandler: (() -> (UITableView.Style))?
    public var tableViewDidSelectRowAtHandler: ((IndexPath) -> ())?
    public var tableViewNumberOfSections: (() -> (Int))?
    
    
    public init(
        _ numberOfRowsInSectionHandler: (() -> (Int))?,
        _ tableViewCellForRowAtHandler: (() -> (UITableViewCell))?,
        _ tableViewStyleHandler: (() -> (UITableView.Style))?,
        _ tableViewDidSelectRowAtHandler: ((IndexPath) -> ())?,
        _ tableViewNumberOfSections: (() -> (Int))?
    ) {
        self.numberOfRowsInSectionHandler = numberOfRowsInSectionHandler
        self.tableViewCellForRowAtHandler = tableViewCellForRowAtHandler
        self.tableViewStyleHandler = tableViewStyleHandler
        self.tableViewDidSelectRowAtHandler = tableViewDidSelectRowAtHandler
        self.tableViewNumberOfSections = tableViewNumberOfSections
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let tableView = RepresentableTableView(frame: .zero, style: tableViewStyleHandler != nil ? tableViewStyleHandler!() : .plain)
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.reloadData()
        return tableView
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }

}
