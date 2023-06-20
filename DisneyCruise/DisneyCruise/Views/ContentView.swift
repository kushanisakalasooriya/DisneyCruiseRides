//
//  LocationMapAnnotationView.swift
//  DisneyCruise
//
//  Created by Kushani Sakalasooriya on 2023-06-10.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var tabSelected: Tab = .house
    @StateObject private var vm = LocationsViewModel()
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                        
//                            Text("\(tab.rawValue.capitalized)")
//                                .bold()
                            
                            if (tab.rawValue.capitalized == "House") {
                                HomePageView()
                            }
                            
                            if (tab.rawValue.capitalized == "Map") {
                                LocationsView()
                                    .environmentObject(vm)
                                
                            }
                                
                            if (tab.rawValue.capitalized == "Cart") {
                                ListOfBookedLocations()
                            }
                                
                        }
                        .tag(tab)
                        
                    }
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $tabSelected)
                    .frame(height: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

