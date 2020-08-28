//
//  CustomTableViewCell.swift
//  Weather
//
//  Created by Пользователь on 26.08.2020.
//  Copyright © 2020 Raisat Ramazanova. All rights reserved.
//

import Foundation
import  UIKit

class CustomTableViewCell:UITableViewCell {
    
    
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    override var reuseIdentifier: String? {
        return "CustomTableViewCell"
    }
    
    
    
}
