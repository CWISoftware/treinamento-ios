//
//  Searchable.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

protocol Searchable {
    var name: String { get set }
    
    func getDetailProperties() -> Dictionary<String, String>
}
