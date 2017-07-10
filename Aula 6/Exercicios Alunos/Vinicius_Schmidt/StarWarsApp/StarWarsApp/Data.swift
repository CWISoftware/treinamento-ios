//
//  Enums.swift
//  StarWarsApp
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Data {
    enum SCREEN_OPTIONS: String {
        case People = "people"
        case Starships = "starships"
        case Films = "films"
        case Planets = "planets"
    }
    
    static let labelsConfig = [SCREEN_OPTIONS.Films.rawValue: ["EPISODE", "RELEASE YEAR", "DIRECTOR"],
                               SCREEN_OPTIONS.People.rawValue: ["HEIGHT", "BIRTH YEAR", "HAIR COLOR"],
                               SCREEN_OPTIONS.Starships.rawValue: ["PASSENGERS", "CREW", "HD RATING"],
                               SCREEN_OPTIONS.Planets.rawValue: ["ROTATION PERIOD", "DIAMETER", "SURFACE WATER"]
    ]
}
