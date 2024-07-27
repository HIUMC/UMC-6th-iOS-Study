//
//  WeatherManager.swift
//  Clima
//
//  Created by 이현주 on 5/27/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2dce7010fc3a429d340deb364ad8d069&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {//URL이니셜라이저를 통해 URL 생성. 옵셔널 URL이 생성되므로, 옵셔널 바인딩
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!) //옵셔널 언래핑
                    return //오류 발생시, 아무것도 안함
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)//위임자 사용해서 didUpdateWeather 호출
                    }
                }
            }
            //completionHandler는 출력 없는 함수 handle을 input값으로 받는다.
            //세션이 네트워킹과 작업이 완료되면 completionHandler를 호출한다.
            //completionHandler가 호출되면 옵션 데이터, 옵션 응답, 옵션 오류를 통과하게 되고 handle를 트리거하도록 task에 맡긴다.
            
            //4. Start the task
            //새로 초기화된 작업은 일시 중단 상태로 시작함
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityname: name, temperature: temp)
            return weather
        } catch {
            print(error)
            return nil
        }
    }
}
