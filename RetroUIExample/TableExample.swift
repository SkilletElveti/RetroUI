//
//  TableExample.swift
//  RetroUIExample
//
//  Created by Shubham Kamdi on 12/17/22.
//

import SwiftUI
import RetroUI

struct TableExample: View {
    var body: some View {
        RUTableView({
            return 30
            }, {
            let cell = UITableViewCell()
            cell.contentView.bringSubviewToFront(cell.textLabel!)
            cell.textLabel?.text = "Hey from SwiftUI"
            return cell
            }).frame(height: 150)
    }
}

struct TableExample_Previews: PreviewProvider {
    static var previews: some View {
        TableExample()
    }
}
