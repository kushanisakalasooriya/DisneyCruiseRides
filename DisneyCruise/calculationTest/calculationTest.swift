//
//  calculationTest.swift
//  calculationTest
//
//  Created by Kushani Sakalasooriya on 2023-06-16.
//

import XCTest

final class calculationTest: XCTestCase {

    func testTotalPrice() {
        let sut = ListOfBookedLocations()
        
        var actual = sut.totalBookingPrice()
        var expected = 0.0
        
        XCTAssertEqual(actual, expected)
    }
    
    func testTicketTotalPeice() {
        let sut = LocationDetailView(location: LocationsDataService.locations.first!)
        
        var actual = sut.calcTotal(price: 20000.00, count: 2)
        var expected = 40000.0
        
        XCTAssertEqual(actual, expected)
    }

}
