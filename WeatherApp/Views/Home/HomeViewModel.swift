//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 26/09/23.
//

import Foundation

enum Units: String {
    case metric
    case imperial
}

class HomeViewModel: ObservableObject {
    
    @Published var weatherData: WeatherData?
    @Published var userName: String = "Matheus"
    @Published var isLoading = false
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE HH:mm"
        
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    func requestDataWeather() {
        isLoading = true
        
        let latitude = -22.9035
        let longitude = -43.2096
        let apiKey = "0bf39d02e255a2a26d0cc452b2fd02e1"
        let lang = "en_us"
        let units = Units.imperial.rawValue ///For temperature in Fahrenheit and wind speed in miles/hour use Imperial, or Metric for temperature in Celsius and wind speed in meter/sec.
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&lang=\(lang)&units=\(units)"

        if let url = URL(string: urlString) {
            APIClient.shared.makeRequest(url: url) { result in
                switch result {
                case .success(let data):
                    do {
                        // Decode the JSON data from the response
                        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                        
                        // Update the weatherData property on the main thread
                        DispatchQueue.main.async {
                            self.weatherData = decodedData
                            self.isLoading = false
                        }
                        
                        print("Success in decoding JSON")
                    } catch {
                        // Handle JSON decoding errors
                        print("Error decoding JSON: \(error)")
                        self.isLoading = false
                    }
                case .failure(let error):
                    // Handle request errors
                    print("Request error: \(error)")
                    self.isLoading = false
                }
            }
        } else {
            print("Invalid URL")
        }
    }

}
