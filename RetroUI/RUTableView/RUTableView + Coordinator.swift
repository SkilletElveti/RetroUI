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
    }
}
