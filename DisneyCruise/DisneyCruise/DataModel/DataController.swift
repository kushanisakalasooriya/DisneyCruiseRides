//
//  DataController.swift
//  SampleCoreData
//
//  Created by Kushani Sakalasooriya on 2023-06-12.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    // Responsible for preparing a model
    let container = NSPersistentContainer(name: "ItemModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully. WUHU!!!")
        } catch {
            // Handle errors in our database
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addItem(name: String, cityName:String, price:Double, ticketCount:Double, context: NSManagedObjectContext) -> Bool {
        
        // Check if an item with the same name already exists
        let fetchRequest: NSFetchRequest<Food> = Food.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingItem = results.first {
                // Item already exists, display alert
                print("\(existingItem) Item already added")
                return false
            }else{
                // Item doesn't exist, proceed to add it
                
                let item = Food(context: context)
                item.date = Date()
                item.name = name
                item.cityName = cityName
                item.price = price
                item.ticketCount = ticketCount
                
                
                save(context: context)
                return true
            }
        } catch {
            print("Failed to fetch items: \(error.localizedDescription)")
            return false
        }
    }
    
    
    func addShoppingItem(name: String, cityName:String, price:Double, ticketCount:Double, context: NSManagedObjectContext) -> Bool {
        
        // Check if an item with the same name already exists
        let fetchRequest: NSFetchRequest<ShoppingItems> = ShoppingItems.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingItem = results.first {
                // Item already exists, display alert
                print("\(existingItem) Item already added")
                return false
            }else{
                // Item doesn't exist, proceed to add it
                
                let item = ShoppingItems(context: context)
                item.date = Date()
                item.name = name
                item.cityName = cityName
                item.price = price
                item.ticketCount = ticketCount
                
                
                save(context: context)
                return true
            }
        } catch {
            print("Failed to fetch items: \(error.localizedDescription)")
            return false
        }
    }
    
}
