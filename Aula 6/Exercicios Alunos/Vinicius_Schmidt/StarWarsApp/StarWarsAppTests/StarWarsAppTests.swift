//
//  StarWarsAppTests.swift
//  StarWarsAppTests
//
//  Created by retina on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import XCTest
@testable import StarWarsApp

class StarWarsAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCallPeopleForAPI() {
        let jsonPerson: [String: Any]  = [
                "name": "Luke Skywalker",
                "mass": "77",
                "birth_year": "19BBY",
                "eye_color": "blue",
                "url": "http://swapi.co/api/people/1/"
        ]
        
        
        let person = Person(json: jsonPerson)
        
        var peopleData = [Person]()
        Person.getPeopleByName("Luke%20Skywalker") { (people, error) in
            if let response = people {
                if error == 0 {
                    peopleData = response
                    
                }
                print(error)
            }
            assert(peopleData.count == 1)
            assert(peopleData[0].name == person.name)
            assert(peopleData[0].mass == person.mass)
            assert(peopleData[0].birthYear == person.birthYear)
            assert(peopleData[0].eyeColor == person.eyeColor)
            assert(peopleData[0].url == person.url)

        }
        
    }
    
    func testCallFilmForAPI() {
        var film = Film()
        film.title = "A New Hope"
        film.episode = 4
        film.year = "1977"
        film.director = "George Lucas"
        
        var filmData = [Film]()
        Film.getFilmsByName("A%20New%20Hope") { (films, error) in
            if let response = films {
                if error == 0 {
                    filmData = response
                }
            }
            assert(filmData.count == 1)
            assert(filmData[0].title == film.title)
            assert(filmData[0].episode == film.episode)
            assert(filmData[0].year == film.year)
            assert(filmData[0].director == film.director)
        }
    }
    
    func testCallStarshipForAPI() {
        var starship = Starship()
        starship.name = "Executor"
        starship.passengers = "38000"
        starship.crew = "279144"
        starship.hyperdriveRating = "2.0"
        var starshipData = [Starship]()
        Starship.getStarshipsByName("Executor") { (starships, error) in
            if let response = starships {
                if error == 0 {
                    starshipData = response
                }
            }
            assert(starshipData.count == 1)
            assert(starshipData[0].name == starship.name)
            assert(starshipData[0].passengers == starship.passengers)
            assert(starshipData[0].crew == starship.crew)
            assert(starshipData[0].hyperdriveRating == starship.hyperdriveRating)
        }
        
    }
    
    
    func testPerformancePersonAPI() {
        self.measure {
            Person.getPeopleByName("Luke%20Skywalker") { (people, error) in
            }
        }
    }
    
    func testPerformanceFilmAPI() {
        self.measure {
            Film.getFilmsByName("A%20New%20Hope") { (starships, error) in
            }
        }
    }
    
    func testPerformanceStarshipAPI() {
        self.measure {
            Starship.getStarshipByName("Executor") { (starships, error) in
            }
        }
    }
    
}
