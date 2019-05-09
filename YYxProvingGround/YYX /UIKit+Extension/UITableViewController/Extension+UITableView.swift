//
//  Extension+UITableView.swift
//  asdada
//
//  Created by young lu on 2019/2/6.
//  Copyright © 2019 young lu. All rights reserved.
//

import Foundation
import UIKit
extension UITableView{
    var defaultCellId:String {return "defaultCellId"}
    func scrollFirstIndex() {
        scrollToRow(at: IndexPath(row: 0, section: 0), at: ScrollPosition.middle, animated: true)
    }
    func disableDeselectCellButButton() {
        self.allowsSelection = false
    }
    func scrollLastInd()  {
        scrollToRow(at: IndexPath(row: self.numberOfRows(inSection: 0)-1, section: 0), at: ScrollPosition.middle, animated: true)
    }
    func giveMeDefaultCell(witchLabelText:String) -> UITableViewCell?{
        
        var cell = self.dequeueReusableCell(withIdentifier:defaultCellId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: defaultCellId)
            cell?.setSelectionStyleIsNone()
            cell?.textLabel?.text = witchLabelText
        }
        return cell
    }
}
