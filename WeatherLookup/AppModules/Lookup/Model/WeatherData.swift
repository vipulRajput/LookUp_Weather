//
//  WeatherData.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import Foundation

struct WeatherData: Codable {
    
    let list: [ForcastData]?
}

struct ForcastData: Codable {
    
    let id: Int
    let name: String?
    let coord: Coordinates?
    let main: Temparature?
    let wind: Wind?
    let weather: [Weather]?
}

struct Coordinates: Codable {
    let lat: Double
    let lon: Double
}

struct Temparature: Codable {
    
    let temp: Float?
    let feelsLike: Float?
    let tempMin: Float?
    let tempMax: Float?
    let pressure: Float?
    let humidity: Float?
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Wind: Codable {
    
    let speed: Float?
}

struct Weather: Codable {
    
    let id: Int
    let main: String?
    let description: String?
}

