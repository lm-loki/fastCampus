//
//  ViewController.swift
//  Weather
//
//  Created by 양주원 on 3/31/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tapFetchWeatherButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string:
                                "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=86db344c062cc036988e3d35513e7428") else {
            return
        }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            // data: 서버에서 응답받은 데이터가 전달, response: http 헤더 및 상태코드가 전달, error: 에러 발생시 에러가 전달 에러없을시 nil이 반환
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder() // json 객체에서 data 유형의 인스턴스로 디코딩하는 객체, decodable 또는 codable을 준수하는 사용자 정의 파일로 변환시켜줌
            let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data)
            // 첫번째 파라미터에는 json을 맵핑시켜줄 codable protocol 준수하는 사용자정의타입 깅비
            // 두번째 파ㅣ라미터에는 서버에서 응답받은 json data 기입
            debugPrint(weatherInformation)
        }.resume()
    }
}

