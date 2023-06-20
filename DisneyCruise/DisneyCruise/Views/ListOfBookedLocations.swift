//
//  ListOfBookedLocations.swift
//  DisneyCruise
//
//  Created by Kushani Sakalasooriya on 2023-06-12.
//

import SwiftUI

struct ListOfBookedLocations: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var shoppingItems: FetchedResults<ShoppingItems>
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack{
                    Text("Total Price: \(Int(totalBookingPrice()))")
                        .foregroundColor(.gray)
                        .padding([.horizontal])
                    Spacer()
                    checkoutButton.padding(.trailing)
                }
                
                List {
                    ForEach(shoppingItems) { shoppingItems in
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(shoppingItems.name!)
                                        .font(.subheadline)
                                        .bold()
                                    Text("Ticket Count: \(String(format: "%.0f", shoppingItems.ticketCount))")
                                        .font(.caption2)
                                        
                                }
                                Spacer()
                                Text("\(String(format: "%.2f", shoppingItems.price))") .foregroundColor(.red)
                            }
                    }
                    .onDelete(perform: deleteFood)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Booked Locations")
            .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Location Deleted"),
                                message: Text("The Location has been successfully deleted."),
                                dismissButton: .default(Text("OK"))
                            )
                        }
          
        }
    }
    
    private var checkoutButton: some View {
        Button {
            
        }label: {
            Text("Checkout")
                .font(.headline)
                .frame(width: 100, height: 25)
        }
        .buttonStyle(.borderedProminent)
    }
    
    // Deletes item at the current offset
    private func deleteFood(offsets: IndexSet) {
        withAnimation {
            offsets.map { shoppingItems[$0] }
            .forEach(managedObjContext.delete)
            
            // Saves to our database
            DataController().save(context: managedObjContext)
            // Show the alert after successful deletion
            showAlert = true
        }
    }
    
    // Calculates the total price
     func totalBookingPrice() -> Double {
        var totalPrice : Double = 0
        for item in shoppingItems {
            totalPrice += item.price
        }
        print("Total Price: \(totalPrice)")
        return totalPrice
    }
    
}

struct ListOfBookedLocations_Previews: PreviewProvider {
    static var previews: some View {
        ListOfBookedLocations()
    }
}
