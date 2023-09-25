//
//  HomeView.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 26/06/23.
//

import SwiftUI

struct HomeView: View {
    var name: String = "Matheus"

    var currentTemperature: Int = 21
    var minTemperature: Int = 7
    var maxTemperature: Int = 25

    var windSpeed: Int = 11
    var humidity: Int = 25
    var feelsLikeTemperature: Int = 22

    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("Seja Bem-Vindo, **\(name)**")
                .font(.system(size: 20, weight: .ultraLight, design: .monospaced))
                .padding(.bottom, 40)
                .padding(.trailing, 40)
            
            Text("RIO DE JANEIRO")
                .font(.system(size: 36, weight: .bold, design: .monospaced))
            
            Text(getFormattedDate())
                .font(.system(size: 32, weight: .ultraLight, design: .monospaced))
            
            Image("weather_center")
                .foregroundColor(.black)
                .font(.system(size: 151, weight: .bold, design: .monospaced))
                .padding(.bottom, -60)
            
            HStack {
                Text("\(currentTemperature)")
                    .font(.system(size: 128, weight: .ultraLight, design: .monospaced))
                
                Text("ºC")
                    .font(.system(size: 32, weight: .ultraLight, design: .monospaced))
                    .padding(.bottom, 60)
                    .padding(.leading, -20)
            }
            .padding(.bottom, -20)
            
            Text("Céu Limpo")
                .font(.system(size: 32, weight: .semibold, design: .monospaced))
            Text("Céu Limpo com poucas nuvens")
                .font(.system(size: 20, weight: .ultraLight, design: .monospaced))
            
            HStack {
                iconDataView(nameImage: "thermometer.sun.fill", data: maxTemperature, sufix: "ºC")
                
                iconDataView(nameImage: "thermometer.snowflake", data: minTemperature, sufix: "ºC")
            }
            
            HStack {
                iconDataView(nameImage: "wind", data: windSpeed, sufix: "KM/H")
                
                iconDataView(nameImage: "drop", data: humidity, sufix: "%")
                
                iconDataView(nameImage: "sun.max", data: feelsLikeTemperature, sufix: "ºC")
            }
            .padding(.bottom, 40)
        }
        .padding()
    }
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE HH:mm"
        
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct iconDataView: View {
    var nameImage: String
    var data: Int
    var sufix: String
    
    var body: some View {
        HStack {
            Image(systemName: "\(nameImage)")
                .foregroundColor(.black)
                .font(.system(size: 32, weight: .ultraLight, design: .monospaced))
                .padding(2)
            Text("\(data)\(sufix)")
                .font(.system(size: 16, weight: .ultraLight, design: .monospaced))
        }
    }
}
