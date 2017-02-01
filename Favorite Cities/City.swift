//
//  City.swift
//  Favorite Cities
//
//  Created by Jen on 2/1/17.
//  Copyright © 2017 JenMachuca. All rights reserved.
//

import UIKit

class City: NSObject {
    
    var name = String ()
    var state = String ()
    var population = Int()
    var image = Data ()
    
    convenience init(name: String, state: String, population: Int, image: Data) {
        self.init()
        self.name = name
        self.state = state
        self.population = population
        self.image = image
        
        // a city object represents one city, then we can set the city,state,population, image would be the flag// 
    }

}
