//
//  StarWarsTests.swift
//  StarWarsTests
//
//  Created by InfraCWI on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import XCTest
@testable import StarWars

class StarWarsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerson() {
        let image = UIImage()
        
        let person = Person(image: image, name: "Ana", height: "100", mass: "80", hairColor: "black")
        
        assert(person.image == image)
        assert(person.name == "Ana")
        assert(person.height == "100")
        assert(person.mass == "80")
        assert(person.hairColor == "black")
    }
    
    func testStarship() {
        let image = UIImage()
        
        let starship = Starship(image: image, name: "Voyager", passengers: "10000", crew: "800", hdRating: "2.0")
        
        assert(starship.image == image)
        assert(starship.name == "Voyager")
        assert(starship.passengers == "10000")
        assert(starship.crew == "800")
        assert(starship.hdRating == "2.0")
    }
    
    func testFilm() {
        let image = UIImage()
        
        let film = Film(image: image, title: "Clone War", episode: 1, releaseDate: "01/01/1990", director: "George Lucas")
        
        assert(film.image == image)
        assert(film.title == "Clone War")
        assert(film.episode == 1)
        assert(film.releaseDate == "01/01/1990")
        assert(film.director == "George Lucas")
    }
    
    func testPlanet() {
        let image = UIImage()
        
        let planet = Planet(image: image, name: "Mars", rotationPeriod: "10", diameter: "5000", surfaceWater: "9000")
        
        assert(planet.image == image)
        assert(planet.name == "Mars")
        assert(planet.rotationPeriod == "10")
        assert(planet.diameter == "5000")
        assert(planet.surfaceWater == "9000")
    }
    
    func testItem() {
        let image = UIImage()
        let item = Item(image: image, name: "name", leftPropertyName: "left", leftPropertyValue: "x", centerPropertyName: "center", centerPropertyValue: "y", rightPropertyName: "right", rightPropertyValue: "z")
        
        assert(item.image == image)
        assert(item.name == "name")
        assert(item.leftPropertyName == "left")
        assert(item.leftPropertyValue == "x")
        assert(item.centerPropertyName == "center")
        assert(item.centerPropertyValue == "y")
        assert(item.rightPropertyName == "right")
        assert(item.rightPropertyValue == "z")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
