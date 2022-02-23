//
//  ForcastTableCell.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import UIKit

class ForcastTableCell: UITableViewCell {

    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }

    func configure(_ forcastData: ForcastData) {
        
        self.weatherTypeLabel.text = "Temp: \(forcastData.weather?.first?.main ?? "")"
        self.tempLabel.text = "Temp: \(forcastData.main?.temp ?? 0)"
    }
}
