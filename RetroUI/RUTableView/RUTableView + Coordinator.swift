//
//  RUTableView + Coordinator.swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/15/22.
//

import Foundation
import UIKit
extension RUTableView {
    public class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
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
        
        public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            guard let kTableView = kTableView,
                  let tableViewTitleForHeaderInSection = kTableView.tableViewTitleForHeaderInSection else { return nil }
            return tableViewTitleForHeaderInSection(section)
        }
        
        public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return nil
        }
    }
}
