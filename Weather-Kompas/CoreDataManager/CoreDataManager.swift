//
//  CoreDataManager.swift
//  Weather-Kompas
//
//  Created by Miftah Juanda Batubara on 08/01/22.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    // MARK: - Persistance
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Weather_Kompas")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - save weather
    func saveDataWeather(city: String, update: String, weather_cond: String, temperature: String, min_tem: String, max_temp: String, sunrise: String, sunset: String, wind: Double, pressure: Int, humidity: Int ) {
        let weather = Weathers(context: persistentContainer.viewContext)
        weather.city_name = city
        weather.update_at = update
        weather.weather_cond = weather_cond
        weather.temperature = temperature
        weather.min_temp = min_tem
        weather.max_temp = max_temp
        weather.sunrise = sunrise
        weather.sunset = sunset
        weather.wind = wind
        weather.pressure = Int16(pressure)
        weather.humidity = Int16(humidity)
        
        save {
            print("Berhasil simpan")
        }
    }
    
    // MARK: - fetch weather
    func fetchWeather() -> Weathers? {
        let request: NSFetchRequest<Weathers> = Weathers.fetchRequest()
        
        var weather: Weathers?
        
        do {
            weather = try persistentContainer.viewContext.fetch(request).last
        }catch {
            print("Error fetch weather")
        }
        return weather
    }
    
    // MARK: - Saved
    func save (onSuccess: @escaping () -> Void) {
        let context = persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if context.hasChanges {
            do {
                try context.save()
                onSuccess()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
