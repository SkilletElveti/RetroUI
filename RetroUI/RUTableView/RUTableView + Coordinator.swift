//
//  RUTableView + Coordinator.swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/15/22.
//

import Foundation
import UIKit
extension RUTableView {
    public class Coordinator: NSObject,
                              UITableViewDelegate,
                              UITableViewDataSource {
        var kTableView: RUTableView?
        init(_ kTableView: RUTableView?) {
            self.kTableView = kTableView
        }
        
        public func numberOfSections(in tableView: UITableView) -> Int {
            guard let kTableView = kTableView,
                  let tableViewNumberOfSections = kTableView.tableViewNumberOfSections else { return 1 }
            return tableViewNumberOfSections()
        }
        
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard let kTableView = kTableView,
                  let numberOfRowsInSectionHandler = kTableView.numberOfRowsInSectionHandler else { return 0 }
            return numberOfRowsInSectionHandler()
        }
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let kTableView = kTableView,
                  let tableViewCellforRowAtHandler = kTableView.tableViewCellForRowAtHandler else { return UITableViewCell() }
            return tableViewCellforRowAtHandler()
        }
        
        public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let kTableView = kTableView,
                  let tableViewDidSelectRowAtHandler = kTableView.tableViewDidSelectRowAtHandler else { return }
            tableViewDidSelectRowAtHandler(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        }
        
        public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            guard let kTableView = kTableView,
                  let tableViewHeightForHeaderInSection = kTableView.tableViewHeightForHeaderInSection else { return 20 }
            return tableViewHeightForHeaderInSection(section)
        }
        
        public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           guard let kTableView = kTableView,
                 let tableViewEstimatedHeightForRowAt = kTableView.tableViewEstimatedHeightForRowAt else { return 50 }
            return tableViewEstimatedHeightForRowAt(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            guard let kTableView  = kTableView,
                  let tableViewCanEditRowAt = kTableView.tableViewCanEditRowAt else { return false }
            return tableViewCanEditRowAt(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            guard let kTableView = kTableView,
                  let tableViewTitleForHeaderInSection = kTableView.tableViewTitleForHeaderInSection else { return nil }
            return tableViewTitleForHeaderInSection(section)
        }
        
        public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard let kTableView = kTableView,
                  let tableviewForHeaderInSection = kTableView.tableviewForHeaderInSection else { return nil }
            return tableviewForHeaderInSection(section)
        }
        
        public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            guard let kTableView = kTableView,
                  let tableViewTitleForFooterInSection = kTableView.tableViewTitleForFooterInSection else { return nil }
            return tableViewTitleForFooterInSection(section)
        }
        
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            guard let kTableView = kTableView,
                  let tableViewHeightForRowAt = kTableView.tableViewHeightForRowAt else { return 45 }
            return tableViewHeightForRowAt(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            guard let kTableView = kTableView,
                  let tableViewWillDisplayForRowAt = kTableView.tableViewWillDisplayForRowAt else { return }
            tableViewWillDisplayForRowAt(cell, indexPath)
        }
        
        public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            guard let kTableView = kTableView,
                  let tableViewWillSelectRowAt = kTableView.tableViewWillSelectRowAt else { return nil }
            return tableViewWillSelectRowAt(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            guard let kTableView = kTableView,
                  let tableViewDidDeselectRowAt = kTableView.tableViewDidDeselectRowAt else { return }
            return tableViewDidDeselectRowAt(indexPath)
        }
        
    }
}
