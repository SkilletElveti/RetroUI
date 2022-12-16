//
//  RepresentableTableView.swift
//  RetroUI
//
//  Created by Shubham Kamdi on 12/15/22.
//

import Foundation
import UIKit
class RepresentableTableView: UITableView {
    init() {
        super.init(frame: CGRectZero, style: UITableView.Style.plain)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, style: UITableView.Style.plain)
       
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
    }
}
