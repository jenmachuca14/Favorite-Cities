//
//  City.swift
//  Favorite Cities
//
//  Created by Jen on 2/1/17.
//  Copyright © 2017 JenMachuca. All rights reserved.
//

import UIKit
import RealmSwift

class City: Object {
    
    dynamic var name = String ()
    dynamic var state = String ()
    dynamic var population = Int()
    dynamic var image = Data()
    
    convenience init(name: String, state: String, population: Int, image: Data) {
        self.init()
        self.name = name
        self.state = state
        self.population = population
        self.image = image
        
        // a city object represents one city, then we can set the city,state,population, image would be the flag// 
    }
    
    // dynamic is a part of the Realm thing and it is saying to the code that " variables that are gonna change, but keep track of them in the data base"

}
