//
//  WeatherService.swift
//  swiftui-weather
//
//  Created by Simarjeet Kaur on 15/05/25.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Main
}

struct Main: Decodable {
    let temp: Double
}

class WeatherService {
    func getWeather(lat: Double, lon: Double, completion: @escaping (WeatherResponse?) -> Void) {
        let apiKey = "7331418e1509b7a944639bec446097ae" // <-- Replace with your OpenWeatherMap API Key
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=imperial&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            let decoded = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            DispatchQueue.main.async {
                completion(decoded)
            }
        }.resume()
    }
}

