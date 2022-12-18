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
        RUTableView(
            numberOfRowsInSectionHandler: {
                return 30
            },
            tableViewCellForRowAtHandler: {
                let cell = UITableViewCell()
                cell.contentView.bringSubviewToFront(cell.textLabel!)
                cell.textLabel?.text = "Hey from SwiftUI"
                return cell
            },
            tableViewStyleHandler: {
                return .insetGrouped
            },
            tableViewDidSelectRowAtHandler: {
                indexPath in
                print("TAP at Section: \(indexPath.section) Row: \(indexPath.row)")
            },
            tableViewNumberOfSections: {
                return 2
            }, tableViewTitleForHeaderInSection: {
                section in
                return section == 0 ? "Section1" : nil
            }, tableviewForHeaderInSection: {
                section in
                if section == 1 {
                    let view = UIView()
                    view.backgroundColor = .blue
                    return view
                }
                return nil
            }, tableViewCanEditRowAt: {
                indexPath in
                if indexPath.row == 1 && indexPath.section == 0 {
                    return false
                }
                return true
            },
            tableViewHeightForHeaderInSection: {
               section in
                if section == 1 {
                    return 90
                }
                return 25
            },
            tableViewEstimatedHeightForRowAt: {
                indexPath in
                if indexPath.row % 2 == 0 {
                    print("Entering 90")
                    return 90
                } else {
                    print("Entering 50")
                    return 50
                }
            },tableViewTitleForFooterInSection: {
                section in
                if section == 1 { return "footer" }
                return nil
            },tableViewHeightForRowAt: {
                index in
                return UITableView.automaticDimension
            }).frame(
                height:
                    UIScreen.main.bounds.height * 0.7
            )
    }
}

struct TableExample_Previews: PreviewProvider {
    static var previews: some View {
        TableExample()
    }
}
