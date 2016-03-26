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
    
    let q3: [Driver]
    let q2: [Driver]
    let q1: [Driver]
    
    init(location: Country, year: Int, q3: [Driver], q2: [Driver], q1: [Driver]) {
        
        self.location = location
        self.year = year
        self.title = "\(location) \(year)"
        
        self.q3 = q3
        self.q2 = q2
        self.q1 = q1
 
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