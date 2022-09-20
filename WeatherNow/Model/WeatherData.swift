//
//  WeatherData.swift
//  WeatherNow
//
//  Created by Vincent Palma on 2022-09-19.
//

import Foundation
import SwiftUI

// Model of the response body we get from calling the OpenWeather API
struct WeatherData: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension WeatherData.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}




// Implement later
//enum WeatherCode: String, Codable {
//    case clear = "1000"
//    case mostlyClear = "1100"
//    case partlyCloudy = "1101"
//    case mostlyCloudy = "1102"
//    case cloudy = "1001"
//    case fog = "2000"
//    case lightFog = "2100"
//    case lightWind = "3000"
//    case wind = "3001"
//    case strongWind = "3002"
//    case drizzle = "4000"
//    case rain = "4001"
//    case lightRain = "4200"
//    case heavyRain = "4201"
//    case snow = "5000"
//    case flurries = "5001"
//    case lightSnow = "5100"
//    case heavySnow = "5101"
//    case freezingDrizzle = "6000"
//    case freezingRain = "6001"
//    case lightFreezingRain = "6200"
//    case heavyFreezingRain = "6201"
//    case icePellets = "7000"
//    case heavyIcePellets = "7101"
//    case lightIcePellets = "7102"
//    case thunderstorm = "8000"
//
//   
//
//    var image: Image {
//        switch self {
//        case .clear:
//            return Image(systemName: "sun.max.fill")
//        case .cloudy:
//            return Image(systemName: "cloud.fill")
//        case .mostlyClear, .partlyCloudy, .mostlyCloudy:
//            return Image(systemName: "cloud.sun.fill")
//        case .fog, .lightFog:
//            return Image(systemName: "cloud.fog.fill")
//        case .lightWind, .wind:
//            return Image(systemName: "wind")
//        case .strongWind:
//            return Image(systemName: "tornado")
//        case .drizzle:
//            return Image(systemName: "cloud.drizzle.fill")
//        case .lightRain, .rain:
//            return Image(systemName: "cloud.rain.fill")
//        case .heavyRain:
//            return Image(systemName: "cloud.heavyrain.fill")
//        case .snow, .flurries, .lightSnow, .heavySnow:
//            return Image(systemName: "snow")
//        case .freezingDrizzle:
//            return Image(systemName: "thermometer.snowflake")
//        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
//            return Image(systemName: "cloud.rain.fill")
//        case .icePellets, .heavyIcePellets, .lightIcePellets:
//            return Image(systemName: "cloud.hail.fill")
//        case .thunderstorm:
//            return Image(systemName: "cloud.bolt.fill")
//        }
//    }
//}
