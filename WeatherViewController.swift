//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel) {
    }
    
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        
        searchTextField.delegate = self // <- .delegate shows the view did load how to accept input from the "search" button on the keyboard. Must add "UITextFieldDelegate" to the class at the top.
        
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)// <- this code puts the keyboard away afer search is pressed from the search button
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // <- this code puts the keyboard away afer search is pressed from the keyboard search button
        
        
        
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{ // <-if the text field is not an empty String...
            return true  // <- return textFieldShouldEndEditing true
        } else { // <- if it is...
            textField.placeholder = "Enter a City" // <- make this text appear
            return false
            // this block of code does not allow the user to search without entering a city name.
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = "" // <- This block of code clears the text field to an empty string after the search button is pressed. This is done with the "textFieldDidEndEditing" delegate.
    }
    
    }
   
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.temp)
        
    }
    

