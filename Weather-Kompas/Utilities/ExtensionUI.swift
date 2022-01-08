//
//  ExtensionUI.swift
//  Weather-Kompas
//
//  Created by Miftah Juanda Batubara on 08/01/22.
//

import UIKit

// alert
func alert(title: String, message: String, vc: UIViewController) {
    DispatchQueue.main.async {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in }))
        vc.present(alert, animated: true)
    }
}

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
