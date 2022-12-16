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
        
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            UITableViewCell()
        }
        
        public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }
        
        public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        }
        
        public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return nil
        }
        
        public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return nil
        }
    }
}
