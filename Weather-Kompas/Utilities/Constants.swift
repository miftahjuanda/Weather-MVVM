//
//  Constants.swift
//  Weather-Kompas
//
//  Created by Miftah Juanda Batubara on 06/01/22.
//

import Foundation
import UIKit

struct Constants {
    static let marginLeft: CGFloat = 16
    static let marginRight: CGFloat = 16
    static let marginTop: CGFloat = 16
    static let marginBottom: CGFloat = 16
    static let margin5: CGFloat = 5
    static let margin7: CGFloat = 7
    static let margin10: CGFloat = 10
}

let urlWeather = "https://api.openweathermap.org/data/2.5/weather?"



// converter timezone from API to UI
func localTime(in timeZone: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
    dateFormatter.timeZone = TimeZone(identifier: timeZone)

    return dateFormatter.string(from: Date())
}

//Converter time
func convertTime(timeInterval: Int) -> String?{
    let time = Double(timeInterval)
    let sunriseDate = Date(timeIntervalSince1970: time)
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    
    let formattedTime = formatter.string(from: sunriseDate)
    return formattedTime
}
