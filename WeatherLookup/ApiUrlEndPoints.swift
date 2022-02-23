//
//  ApiUrlEndPoints.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import Foundation

struct Constants {
    
    static let apiKey = "8366930b8819a675fefc075f50abd929"
    static let invalidCityNameError = "Please enter valid city name!"
    static let genericError = "something went wrong!"
    static let noRecordsFoundError = "No Record found for this city, please try again!"
}

enum ApiUrlEndPoints {
    
    case getWeatherForcastData(String)
    
    var endpoint: URL? {
        
        switch self {
    
        case .getWeatherForcastData(let city):
            return URL(string: "http://api.openweathermap.org/data/2.5/find?q=\(city.trimmingCharacters(in: .whitespaces))&appid=\(Constants.apiKey)")
        }
    }
}
