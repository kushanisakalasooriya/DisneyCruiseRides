//
//  LocationDetailView.swift
//  DisneyCruise
//
//  Created by Kushani Sakalasooriya on 2023-06-11.
//

import SwiftUI



struct LocationDetailView: View {
    
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location : Location
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State var ticketCount : Int = 1
    @State var price : Double = 100.0
    
    @State private var showAlert = false
    @State private var alertMessage = ""
        
    var body: some View {
        ScrollView {
            VStack{
                imageSection
                
                VStack(alignment: .leading, spacing: 6){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    addToCartSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton ,alignment: .topLeading)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location : LocationsDataService.locations.first!)
    }
}

extension LocationDetailView {
    
    private var imageSection : some View {
        TabView{
            ForEach(location.imageNames , id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading , spacing: 7.5) {
            Text(location.name)
                .font(.largeTitle)
            Text(location.cityName)
                .font(.title)
                .foregroundColor(.secondary)
        }
    }
    
    
    private var descriptionSection: some View {
        VStack(alignment: .leading , spacing: 7.5) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
    
    private var backButton : some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(15)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .padding()
            
        }
    }
    
    private var addToCartSection: some View {
        VStack(alignment: .leading , spacing: 7.5) {
            
            HStack{
                Text("Ticket Price : ")
                Text("\(String(format: "%.2f", location.price))")
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            
            Stepper( value: $ticketCount , in: 1...10 , step:1){
                Text("Number of Tickets :  \(ticketCount)")
            }
            
            HStack{
                var totalPrice1 = calcTotal(price: location.price, count: ticketCount)
//                let totalPrice = location.price * Double(ticketCount)
                Text("Total : \(String(format: "%.2f", totalPrice1))")
                    .fontWeight(.bold)
                Spacer()
                addToCartButton
            }
            
        }
    }
    
    func calcTotal(price : Double , count: Int) -> Double {
        let totalPrice = price * Double(count)
        return totalPrice
    }
    
    private var addToCartButton : some View {
        VStack{
            
            Button {
                       let finaltotalprice = location.price * Double(ticketCount)
                       let addedSuccessfully = DataController().addShoppingItem(name: location.name, cityName: location.cityName, price: finaltotalprice, ticketCount: Double(ticketCount), context: managedObjContext)

                       if addedSuccessfully {
                           showAlert = true
                           alertMessage = "The Location has been added to the cart."
                       } else {
                           showAlert = true
                           alertMessage = "The Location already exists in the cart."
                       }
                   } label: {
                       Text("Book")
                           .font(.headline)
                           .frame(width: 120, height: 20)
                   }
                   .buttonStyle(.borderedProminent)
                   .alert(isPresented: $showAlert) {
                       Alert(
                           title: Text("Location Status"),
                           message: Text(alertMessage),
                           dismissButton: .default(Text("OK"))
                       )
                   }
            
            
        }
    }
    
    
}
