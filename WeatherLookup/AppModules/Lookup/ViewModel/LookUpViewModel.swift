//
//  LookUpViewModel.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import Foundation

class LookUpViewModel {
        
    var listWeatherData: ((WeatherData)-> Void)?
    var showErrorMesssage: ((String)-> Void)?
    
    func getWeatherData(for city: String) {
        
        if city.isEmpty || city.count <= 2 {
            self.showErrorMesssage?(Constants.invalidCityNameError)
        } else {
            if let url = ApiUrlEndPoints.getWeatherForcastData(city).endpoint {
                Interceptor.fetchData(url: url, type: WeatherData.self) { [weak self] (data, error) in
                    if let weatherData = data {
                        debugPrint(weatherData)
                        if let list = weatherData.list, list.isEmpty {
                            DispatchQueue.main.async {
                                self?.showErrorMesssage?(Constants.noRecordsFoundError)
                            }
                        } else {
                            DispatchQueue.main.async {
                                self?.listWeatherData?(weatherData)
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            self?.showErrorMesssage?(error?.localizedDescription ?? Constants.genericError)
                        }
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.showErrorMesssage?(Constants.genericError)
                }
            }
        }
    }
}
