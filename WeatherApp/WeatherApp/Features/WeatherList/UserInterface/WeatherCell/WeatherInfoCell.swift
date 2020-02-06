//
//  WeatherInfoCell.swift
//  WeatherApp
//
//  Created by Sven Svetina on 05/02/2020.
//  Copyright © 2020 Sven Svetina. All rights reserved.
//

import Foundation
import UIKit

class WeatherInfoCell: UITableViewCell {
    
    static let identifier = String(describing: WeatherInfoCell.self)
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: Weather, indexPath: IndexPath) {
        
        nameLabel.text = model.name
        tempLabel.text = "\(model.weatherMainInfo.temp)F"
        countryLabel.text = "\(model.weatherLocation.country)"
        
        nameLabel.sizeToFit()
        tempLabel.sizeToFit()
        countryLabel.sizeToFit()
    }
}
