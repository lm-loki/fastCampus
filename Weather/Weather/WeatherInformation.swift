//
//  File.swift
//  Weather
//
//  Created by 양주원 on 4/1/24.
//

import Foundation

struct WeatherInformation: Codable { //codable은 Json encoding과 decoding이 모두 가능한
    //서버에서 전달받은 날씨정보 json data를 WeatherInformation으로 변환하는 작업 decoding 하는 작업
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
