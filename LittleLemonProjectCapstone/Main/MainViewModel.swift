//
//  MainViewModel.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import Foundation
import CoreData

class MainViewModel: ObservableObject {
    
    @Published var dishes: [Dish] = []
    
    func getMenuData(coreDataContext: NSManagedObjectContext) async {
        // Check if data exists in Core Data, if not, fetch new data
        let hasExistingData = await checkExistingDishes(coreDataContext)
        if !hasExistingData {
            await fetchAndSaveMenuData(coreDataContext)
        }
    }

    private func checkExistingDishes(_ coreDataContext: NSManagedObjectContext) async -> Bool {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        
        do {
            let existingDishes = try coreDataContext.fetch(fetchRequest)
            return !existingDishes.isEmpty
        } catch {
            print("Error fetching existing dishes: \(error.localizedDescription)")
            return false
        }
    }

    private func fetchAndSaveMenuData(_ coreDataContext: NSManagedObjectContext) async {
        let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        guard let url = URL(string: menuAddress) else {
            print("Invalid URL")
            return
        }
        
        do {
            // Clear existing items
            PersistenceController.shared.clear()
            
            // Fetch data from API
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode JSON
            let menuItem = try JSONDecoder().decode(MenuList.self, from: data)
            
            // Save new data to Core Data
            for menu in menuItem.menu {
                let dish = Dish(context: coreDataContext)
                dish.title = menu.title
                dish.itemDescription = menu.itemDescription
                dish.image = menu.image
                dish.price = menu.price
                dish.category = menu.category
            }
            
            try coreDataContext.save()
            
        } catch {
            print("Error fetching or saving menu data: \(error.localizedDescription)")
        }
    }
    
    private func fetchAllDishes(_ coreDataContext: NSManagedObjectContext) async {
            let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
            
            do {
                dishes = try coreDataContext.fetch(fetchRequest) 
            } catch {
                print("Error fetching dishes: \(error.localizedDescription)")
            }
        }
}

