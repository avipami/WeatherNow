//
//  WeatherManager.swift
//  WeatherNow
//
//  Created by Vincent Palma on 2022-09-19.
//

import Foundation
import Combine
import CoreLocation

class WeatherManager : ObservableObject{
    var apiKey = WeatherAPIKey().getApiKey()
    
    @Published var isFetching = false
    
    func getCurrentWeather( latitude : CLLocationDegrees, longitude : CLLocationDegrees) async throws -> WeatherData{
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
        
        return decodedData
        
    }
    
    
    // Future combine function
//    func getCurrentWeather2( latitude : CLLocationDegrees, longitude : CLLocationDegrees ) -> AnyPublisher<WeatherData, Error>{
//
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric")
//        else {
//            fatalError("Missing URL")
//        }
//
//        let decoder = JSONDecoder()
//
//        return URLSession
//            .shared
//            .dataTaskPublisher(for: url)
//            .receive(on: DispatchQueue.main)
//            .map(\.data)
//            .decode(type: WeatherData.self, decoder: decoder)
//            .eraseToAnyPublisher()
//    }
}


