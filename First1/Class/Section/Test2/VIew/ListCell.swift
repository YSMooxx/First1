//
//  ListCell.swift
//  First1
//
//  Created by New on 2022/9/12.
//

import Foundation
import UIKit

class ListCell:UITableViewCell {
    
    var label:UILabel = UILabel.init()
    
    var model:ListModel? {
        
        didSet {
            
            textLabel?.text = model?.name
        }
    }
    
    
    
}
