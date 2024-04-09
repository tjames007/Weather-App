//
//  Model.swift
//  Clima
//
//  Created by Tyler James on 2/14/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?lat=57&lon=-2.15&appid=6b0fb4bed6a6da97b49c5e29ad477bcc&units=imperial"
    
    var delegate: WeatherManagerDelegate? 
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        
    }
    func performRequest(urlString: String){
        // 1. create URL
        guard let url = URL(string: urlString) else { return } // "URL" structure initializer that accepts a String
        // 2. create URL Session
        let session = URLSession(configuration: .default)
        
        // 3. give session a task
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data{
               let weather = self.parseJSON(weatherData: safeData)
                self.delegate?.didUpdateWeather(weather: weather!)
                
            }
        }
        // 4 start the task
        
        task.resume()
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0]
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temp: temp)
            
            
            
            print(weather.temperatureString)
        } catch {
            print(error)
            return nil
        }
    }
   
    }

