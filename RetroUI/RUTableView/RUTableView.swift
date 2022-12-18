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
    public var tableViewTitleForHeaderInSection: ((Int) -> (String?))?
    public var tableviewForHeaderInSection: ((Int) -> (UIView?))?
    public var tableViewCanEditRowAt: ((IndexPath) -> (Bool))?
    public var tableViewHeightForHeaderInSection: ((Int) -> (CGFloat))?
    public var tableViewEstimatedHeightForRowAt: ((IndexPath) -> (CGFloat))?
    public var tableViewTitleForFooterInSection: ((Int) -> (String?))?
    public var tableViewHeightForRowAt: ((IndexPath) -> (CGFloat))?
    public var tableViewWillDisplayForRowAt: ((UITableViewCell,IndexPath) -> ())?
    public init(
        
        numberOfRowsInSectionHandler: (() -> (Int))?,
        tableViewCellForRowAtHandler: (() -> (UITableViewCell))?,
        tableViewStyleHandler: (() -> (UITableView.Style))?,
        tableViewDidSelectRowAtHandler: ((IndexPath) -> ())?,
        tableViewNumberOfSections: (() -> (Int))?,
        tableViewTitleForHeaderInSection: ((Int) -> (String?))?,
        tableviewForHeaderInSection: ((Int) -> (UIView?))?,
        tableViewCanEditRowAt: ((IndexPath) -> (Bool))?,
        tableViewHeightForHeaderInSection:  ((Int) -> (CGFloat))?,
        tableViewEstimatedHeightForRowAt: ((IndexPath) -> (CGFloat))?,
        tableViewTitleForFooterInSection: ((Int) -> (String?))?,
        tableViewHeightForRowAt: ((IndexPath) -> (CGFloat))?,
        tableViewWillDisplayForRowAt: ((UITableViewCell,IndexPath) -> ())?
        
    ) {
        
        self.numberOfRowsInSectionHandler = numberOfRowsInSectionHandler
        self.tableViewCellForRowAtHandler = tableViewCellForRowAtHandler
        self.tableViewStyleHandler = tableViewStyleHandler
        self.tableViewDidSelectRowAtHandler = tableViewDidSelectRowAtHandler
        self.tableViewNumberOfSections = tableViewNumberOfSections
        self.tableViewTitleForHeaderInSection = tableViewTitleForHeaderInSection
        self.tableviewForHeaderInSection = tableviewForHeaderInSection
        self.tableViewCanEditRowAt = tableViewCanEditRowAt
        self.tableViewHeightForHeaderInSection = tableViewHeightForHeaderInSection
        self.tableViewEstimatedHeightForRowAt = tableViewEstimatedHeightForRowAt
        self.tableViewTitleForFooterInSection = tableViewTitleForFooterInSection
        self.tableViewHeightForRowAt = tableViewHeightForRowAt
        self.tableViewWillDisplayForRowAt = tableViewWillDisplayForRowAt
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
