//
//  ContentView.swift
//  WeatherNow
//
//  Created by Vincent Palma on 2022-09-19.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @StateObject var weatherManager = WeatherManager()
    @State var weather: WeatherData?
    
    var body: some View {
        ZStack {
            
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Error getting data \(error)")
                            }
                        }     
                }
                
            } else {
                if locationManager.isLoading {
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }.background(Color(hue: 0.5, saturation: 0.7, brightness: 0.3))
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
