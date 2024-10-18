//
//  MainViewModel.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import Foundation
import CoreData

@MainActor
class MainViewModel: ObservableObject {
    
    @Published var dishes: [Dish] = []
    @Published var isDataLoading: Bool = false
    
    func getMenuData(coreDataContext: NSManagedObjectContext) async {
        isDataLoading = true
        defer { isDataLoading = false }
        
        let hasExistingData = await checkExistingDishes(coreDataContext)
        if !hasExistingData {
            await fetchAndSaveMenuData(coreDataContext)
        }
        await fetchAllDishes(coreDataContext)
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
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let menuItem = try JSONDecoder().decode(MenuList.self, from: data)
            
            // Use batch insert for better performance
            await coreDataContext.perform {
                for menu in menuItem.menu {
                    let dish = Dish(context: coreDataContext)
                    dish.title = menu.title
                    dish.itemDescription = menu.itemDescription
                    dish.image = menu.image
                    dish.price = menu.price
                    dish.category = menu.category
                }
                
                try? coreDataContext.save()
            }
        } catch {
            print("Error fetching or saving menu data: \(error.localizedDescription)")
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
    
    private func fetchAllDishes(_ coreDataContext: NSManagedObjectContext) async {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        do {
            dishes = try coreDataContext.fetch(fetchRequest)
        } catch {
            print("Error fetching dishes: \(error.localizedDescription)")
        }
    }
}
