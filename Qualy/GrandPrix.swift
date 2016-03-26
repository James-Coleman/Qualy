//
//  GrandPrix.swift
//  Qualy
//
//  Created by James Coleman on 25/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class GrandPrix: NSObject {
    
    let location: Country
    let year: Int
    let title: String
    
    let results: [Driver]
    
    init(location: Country, year: Int, results: [Driver]) {
        
        self.location = location
        self.year = year
        self.title = "\(location) \(year)"
        
        self.results = results
 
    }
    
    enum Country {
        case AUS
        case BHR
        case CHN
        case RUS
        case ESP
        case MON
        case CAN
        case EUR
        case AUT
        case GBR
        case HUN
        case GER
        case BEL
        case ITA
        case SIN
        case MAL
        case JPN
        case USA
        case MEX
        case BRA
        case ABU
    }
    
}