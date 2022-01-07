//
//  WeatherViewModel.swift
//  Weather-Kompas
//
//  Created by Miftah Juanda Batubara on 06/01/22.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class WeatherViewModel {
    
    private var weatherModelSubject = PublishSubject<WeatherModel?>()
    
    var weatherModelObservable: Observable<WeatherModel?> {
        return weatherModelSubject
    }
    
    func getDataWeather(lat: String, lon: String) {
        let params = [
            "lat":lat,
            "lon":lon,
            "appid":"49889494d4f517dca01bc0f0e0093fa4"
        ]
        
        APIManager.instance.CallAPI(url: urlWeather, method: .get, params: params, encoding: URLEncoding.default, headers: nil, completion: { [weak self] (weatherModel: WeatherModel?, errorModel: ErrorModel?, error)  in
//            print(weatherModel?.name, "namee")
            guard let self = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let errorModel = errorModel {
                print(errorModel.message)
            } else {
                guard let weatherModel = weatherModel else { return }
        
                if weatherModel.weather.count > 0 {
                    self.weatherModelSubject.onNext(weatherModel)
                }
            }
        })
    }
    
}
