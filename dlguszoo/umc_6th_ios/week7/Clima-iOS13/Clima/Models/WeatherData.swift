//
//  WeatherData.swift
//  Clima
//
//  Created by 이현주 on 6/22/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable { //외부 표현(JSON)으로부터 자신을 decode할 수 있는 유형으로 변함
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
