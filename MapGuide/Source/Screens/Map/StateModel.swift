//
//  StateModel.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 3/5/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import Foundation
import CoreLocation
struct State {
    
//    let name: String
    let lat: Double
    let long: Double
    
//    let snippets: String
    init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
    }
}
