//
//  WelcomeView.swift
//  WeatherNow
//
//  Created by Vincent Palma on 2022-09-19.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            VStack {
                VStack (spacing: 20){
                    Text("Hello, There!").bold().font(.title)
                    Text("We are looking at how \nthe weather is at your place")
                    Text("Just press this button \nfor the magic to happen\n\n👇🏼")
                }
                .multilineTextAlignment(.center)
                    
                LocationButton(.shareCurrentLocation){
                    locationManager.requestLocation()
                }.cornerRadius(30).foregroundColor(.white)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
