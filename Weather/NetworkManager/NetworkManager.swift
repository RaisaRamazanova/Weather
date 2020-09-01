//
//  NetworkManager.swift
//  Weather
//
//  Created by Пользователь on 13.08.2020.
//  Copyright © 2020 Raisat Ramazanova. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private init() {}
    
    static let shared: NetworkManager = NetworkManager()
    
    func getWeather(city: String, result: @escaping ((OfferModel?) -> ())) {
    
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        urlComponents.queryItems = [URLQueryItem(name: "q", value: city), URLQueryItem(name: "appid", value: "0eb6b62fd8a750a7ac88d10a0494f71c")]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                var decoderOfferModel: OfferModel?
                
                if data != nil {
                    decoderOfferModel = try? decoder.decode(OfferModel.self, from: data!)
                }
                
                result(decoderOfferModel)
            } else {
                print(error as Any)
            }
        }.resume()
    }
}
