//
//  Main.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import SwiftUI
import CoreData

struct Main: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var vm = MainViewModel()
    
    @State var searchText: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            MainHeader()
            MainHero()
            OrderDeliverySection()
            Divider().padding([.leading, .trailing, .top])
            DishesListView()
        }
        .task {
            await vm.loadMenuData(context: viewContext)
        }
    }
    
    // MARK: - OrderDeliverySection
    @ViewBuilder
    private func OrderDeliverySection() -> some View {
        VStack(alignment: .leading) {
            Text("Order for Delivery")
                .font(.title2)
                .fontWeight(.bold)
                .padding([.top, .leading], 20)
            
            ScrollView(.horizontal,  showsIndicators: false) {
                HStack(spacing: 20) {
                    FetchedObjects(
                        predicate: buildPredicate(),
                        sortDescriptors: buildSortDescriptors()
                    ) { (dishes: [Dish]) in
                        ForEach(dishes, id: \.self) { dish in
                            NavigationLink(destination: MainOrder(dish: dish)) {
                                Text(dish.category ?? "")
                                    .styledText()
                            }
                        }
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
        }
    }
    
    // MARK: - DishesListView
    @ViewBuilder
    private func DishesListView() -> some View {
        NavigationView {
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()
            ) { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id: \.self) { dish in
                        NavigationLink(destination: MainDetails(dish: dish)) {
                            if vm.isLoading {
                                ProgressView()
                                    .scaleEffect(0.3)
                            } else {
                                DishRowView(dish: dish)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText)
            }
        }
    }
    
    // MARK: - DishRowView
    @ViewBuilder
    private func DishRowView(dish: Dish) -> some View {
        HStack(spacing: 25) {
            VStack(alignment: .leading, spacing: 10) {
                Text(dish.title ?? "")
                    .fontWeight(.bold)
                
                Text(dish.itemDescription ?? "")
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                
                
                if let price = Double(dish.price ?? "") {
                    let forrmatedPrice = NumberFormatter.currency.string(from: price as NSNumber) ?? ""
                    Text(forrmatedPrice)
                        .fontWeight(.bold)
                }
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 130, height: 100)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
        }
        .padding(.vertical, 10)
    }
    
    // MARK: - Helper Functions
    private func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[c] %@", searchText)
        }
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(
            key: "title",
            ascending: true,
            selector: #selector(NSString.localizedStandardCompare(_:)))
        ]
    }

}


#Preview {
    Main()
}



