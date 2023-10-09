//
//  HomeView.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 26/06/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Text("Welcome, \(viewModel.userName)")
                    .customTitleStyle(trailingPadding: 40)
                
                Text(cityName)
                    .customTitleStyle(fontSize: 36, fontWeight: .bold)
                
                Text(viewModel.getFormattedDate())
                    .customTitleStyle(fontSize: 32, fontWeight: .ultraLight)
                
                Image("weather_center")
                    .foregroundColor(.black)
                    .font(.system(size: 151, weight: .bold, design: .monospaced))
                    .padding(.bottom, -50)
                
                HStack {
                    Text(temperature)
                        .customTitleStyle(fontSize: 128, fontWeight: .ultraLight, topPadding: 20)
                        
                    Text("ºF")
                        .customTitleStyle(fontSize: 32, fontWeight: .ultraLight, leadingPadding: -20, bottomPadding: 60)
                }
                .padding(.leading, 20)
                
                Text(weatherMain)
                    .customTitleStyle(fontSize: 32, fontWeight: .semibold)
                
                Text(weatherDescription.capitalizeFirstLetterOfEachSentence())
                    .customTitleStyle(fontSize: 20, fontWeight: .ultraLight)
                
                HStack(spacing: 20) {
                    iconDataView(nameImage: "thermometer.sun.fill", data: tempMax, sufix: "ºF")
                    
                    iconDataView(nameImage: "thermometer.snowflake", data: tempMin, sufix: "ºF")
                }
                
                HStack(spacing: 20) {
                    iconDataView(nameImage: "wind", data: windSpeed, sufix: "mph")
                    
                    iconDataView(nameImage: "drop", data: humidity, sufix: "%")
                    
                    iconDataView(nameImage: "sun.max", data: feelsLike, sufix: "ºF")
                }
            }
            .customBackground()
            .onAppear {
                viewModel.requestDataWeather()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
        }
    }
}

//MARK: - Vars default values
extension HomeView {
    var cityName: String {
        return viewModel.weatherData.name
    }
    
    var temperature: String {
        return viewModel.weatherData.main.temp.formatWithInt()
    }
    
    var weatherMain: String {
        return viewModel.weatherData.weather.first?.main ?? "Ceu Limpo"
    }
    
    var weatherDescription: String {
        return viewModel.weatherData.weather.first?.description ?? "Céu Limpo com poucas nuvens"
    }
    
    var tempMax: Double {
        return viewModel.weatherData.main.tempMax
    }
    
    var tempMin: Double {
        return viewModel.weatherData.main.tempMin
    }
    
    var windSpeed: Double {
        return viewModel.weatherData.wind.speed
    }
    
    var humidity: Double {
        return Double(viewModel.weatherData.main.humidity)
    }
    
    var feelsLike: Double {
        return viewModel.weatherData.main.feelsLike
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
