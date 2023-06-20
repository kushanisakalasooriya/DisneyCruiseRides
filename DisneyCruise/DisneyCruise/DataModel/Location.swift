//
//  Locations.swift
//  DisneyCruise
//
//  Created by Kushani Sakalasooriya on 2023-05-20.
//

import Foundation
import MapKit

struct Location : Identifiable, Equatable{

    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    let price: Double
    
    var id: String {
        name + cityName
    }
    
//    Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
