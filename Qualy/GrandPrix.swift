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
    
    let q3: [Driver]
//    let q3FirstTime: Double
//    let q3Differences: [Double]
    let q2: [Driver]
//    let q2FirstTime: Double
//    let q2Differences: [Double]
    let q1: [Driver]
//    let q1FirstTime: Double
//    let q1Differences: [Double]
    
    init(location: Country, year: Int, q3: [Driver], q2: [Driver], q1: [Driver]) {
        self.location = location
        self.year = year
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
