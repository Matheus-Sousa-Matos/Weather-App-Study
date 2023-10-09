//
//  WeatherDataMock.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 09/10/23.
//

import Foundation

extension WeatherData {
    static public func empty() -> Self {
        WeatherData(coord: .empty(), weather: [.empty()], base: "", main: .empty(), visibility: 0, wind: .empty(), clouds: .empty(), dt: 0, sys: .empty(), timezone: 0, id: 0, name: "", cod: 0)
    }
    
    static public func with(
        coord: Coord = .with(),
        weather: [Weather] = [.with()],
        base: String = "stations",
        main: Main = .with(),
        visibility: Int = 10000,
        wind: Wind = .with(),
        clouds: Clouds = .with(),
        dt: Int = 1696882732,
        sys: Sys = .with(),
        timezone: Int = -10800,
        id: Int = 3451190,
        name: String = "Rio de Janeiro",
        cod: Int = 200)
    -> Self {
        WeatherData(coord: coord, weather: weather, base: base, main: main, visibility: visibility, wind: wind, clouds: clouds, dt: dt, sys: sys, timezone: timezone, id: id, name: name, cod: cod)
    }
}

extension Coord {
    static public func empty() -> Self {
        Coord(lon: 0.0, lat: 0.0)
    }
    
    static public func with(
        lon: Double = -43.2096,
        lat: Double = -22.9035)
    -> Self {
        Coord(lon: lon, lat: lat)
    }
}

extension Clouds {
    static public func empty() -> Self {
        Clouds(all: 0)
    }
    
    static public func with(
        all: Int = 100)
    -> Self {
        Clouds(all: all)
    }
}

extension Main {
    static public func empty() -> Self {
        Main(temp: 0.0, feelsLike: 0.0, tempMin: 0.0, tempMax: 0.0, pressure: 0, humidity: 0)
    }
    
    static public func with(
        temp: Double = 22.0,
        feelsLike: Double = 24.0,
        tempMin: Double = 17.0,
        tempMax: Double = 33.0,
        pressure: Int = 10,
        humidity: Int = 25
    ) -> Self {
        Main(temp: temp, feelsLike: feelsLike, tempMin: tempMin, tempMax: tempMax, pressure: pressure, humidity: humidity)
    }
}

extension Sys {
    static public func empty() -> Self {
        Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0)
    }
    
    static public func with(
        type: Int = 1,
        id: Int = 8429,
        country: String = "BR",
        sunrise: Int = 1696839954,
        sunset: Int = 1696884850
    ) -> Self {
        Sys(type: type, id: id, country: country, sunrise: sunrise, sunset: sunset)
    }
}

extension Weather {
    static public func empty() -> Self {
        Weather(id: 0, main: "", description: "", icon: "")
    }
    
    static public func with(
        id: Int = 804,
        main: String = "Clouds",
        description: String = "overcast clouds",
        icon: String = "04d"
    ) -> Self {
        Weather(id: id, main: main, description: description, icon: icon)
    }
}

extension Wind {
    static public func empty() -> Self {
        Wind(speed: 0.0, deg: 0)
    }
    
    static public func with(
        speed: Double = 7.2,
        deg: Int = 220
    ) -> Self {
        Wind(speed: speed, deg: deg)
    }
}
