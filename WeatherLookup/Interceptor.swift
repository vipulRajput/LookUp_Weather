//
//  Interceptor.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import Foundation

class Interceptor {
    
    static func fetchData<T: Codable>(url: URL, type: T.Type, completion: @escaping (T?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _data = data {
                
                do {
                    let parsedData = try JSONDecoder().decode(type, from: _data)
                    completion(parsedData, nil)
                } catch let error {
                    debugPrint(error)
                    completion(nil, error)
                }
            } else {
                completion(nil, nil)
            }
        }.resume()
    }
}
