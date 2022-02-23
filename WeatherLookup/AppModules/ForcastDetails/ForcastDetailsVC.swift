//
//  ForcastDetailsVC.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import UIKit

class ForcastDetailsVC: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var weatherTypeDescLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var forcastData: ForcastData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialSetup()
    }
}

extension ForcastDetailsVC {
    
    private func initialSetup() {
                
        guard let forcastInfo = forcastData else { return }
        
        self.tempLabel.text = forcastInfo.main?.temp?.description ?? ""
        self.feelsLikeLabel.text = "Feels Like:- " + (forcastInfo.main?.feelsLike?.description ?? "")
        self.weatherTypeLabel.text = forcastInfo.weather?.first?.main ?? ""
        self.weatherTypeDescLabel.text = forcastInfo.weather?.first?.description ?? ""
        self.infoLabel.text = "Min Temp:- \(forcastInfo.main?.tempMin ?? 0)\n\nMax Temp:- \(forcastInfo.main?.tempMax ?? 0)\n\nHumidity:- \(forcastInfo.main?.humidity ?? 0)\n\nWind Speed:- \(forcastInfo.wind?.speed ?? 0)\n\nCoordinates:- \(forcastInfo.coord?.lat ?? 0), \(forcastInfo.coord?.lon ?? 0)"
    }
}
