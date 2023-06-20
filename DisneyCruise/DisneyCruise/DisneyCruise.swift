//
//  LocationMapAnnotationView.swift
//  DisneyCruise
//
//  Created by Kushani Sakalasooriya on 2023-06-10.
//

import SwiftUI

@main
struct SampleCoreDataApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
        }
    }
}
