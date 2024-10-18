//
//  MainViewModel.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import Foundation
import CoreData

@MainActor
final class MainViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published private(set) var dishes: [Dish] = []
    @Published private(set) var isLoading = false
    @Published var error: Error?
    
    // MARK: - Constants
    private enum Constants {
        static let menuURL = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
    }
    
    // MARK: - Public Methods
    func loadMenuData(context: NSManagedObjectContext) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            if try await !hasExistingDishes(in: context) {
                try await fetchAndSaveMenuData(to: context)
            }
            try await fetchDishes(from: context)
        } catch {
            self.error = error
        }
    }
    
    // MARK: - Private Methods
    private func fetchAndSaveMenuData(to context: NSManagedObjectContext) async throws {
        let (data, _) = try await URLSession.shared.data(from: Constants.menuURL)
        let menuList = try JSONDecoder().decode(MenuList.self, from: data)
        
        // Clear existing data
        PersistenceController.shared.clear()
        
        try await context.perform {
            for menuItem in menuList.menu {
                let dish = Dish(context: context)
                dish.configure(with: menuItem)
            }
            try context.save()
        }
    }
    
    private func hasExistingDishes(in context: NSManagedObjectContext) async throws -> Bool {
        try await context.perform {
            let request: NSFetchRequest<Dish> = Dish.fetchRequest()
            request.fetchLimit = 1
            return try context.count(for: request) > 0
        }
    }
    
    private func fetchDishes(from context: NSManagedObjectContext) async throws {
        let request: NSFetchRequest<Dish> = Dish.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Dish.title, ascending: true)]
        
        let fetchedDishes = try await context.perform {
            try context.fetch(request)
        }
        dishes = fetchedDishes
    }
}

// MARK: - Dish Extension
private extension Dish {
    func configure(with menuItem: MenuItem) {
        title = menuItem.title
        itemDescription = menuItem.itemDescription
        image = menuItem.image
        price = menuItem.price
        category = menuItem.category
    }
}
