//
//  GreenCycleTests.swift
//  GreenCycleTests
//
//  Created by Doãn Hồng Ngọc on 18/04/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import XCTest
@testable import GreenCycle

class GreenCycleTests: XCTestCase {
    
    let camera = CameraViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBiowasteCategory() {
        camera.labelWasWhenCaptured = "Banana"
        camera.setCorrectCategory()
        XCTAssertEqual(camera.correctCategory, "Biowaste", "Wrong category set")
    }
    
    func testHazardousCategory() {
        camera.labelWasWhenCaptured = "Computer"
        camera.setCorrectCategory()
        XCTAssertEqual(camera.correctCategory, "Hazardous waste", "Wrong category set")
    }
    
    func testPaperCategory() {
        camera.labelWasWhenCaptured = "Paper"
        camera.setCorrectCategory()
        XCTAssertEqual(camera.correctCategory, "Paper", "Wrong category set")
    }
    
    func testPlasticCategory() {
        camera.labelWasWhenCaptured = "Plastic"
        camera.setCorrectCategory()
        XCTAssertEqual(camera.correctCategory, "Plastic", "Wrong category set")
    }
    
    func testGlassCategory() {
        camera.labelWasWhenCaptured = "Glass bottle"
        camera.setCorrectCategory()
        XCTAssertEqual(camera.correctCategory, "Glass", "Wrong category set")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
