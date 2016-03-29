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
    
    let kind: Kind
    let kindDescriptor: String
    
    let sessions: [[Driver]]
    
    init(location: Country, year: Int, kind: Kind, sessions: [[Driver]]) {
        
        self.location = location
        self.year = year
        self.title = "\(location) \(year)"
        
        self.kind = kind
        self.kindDescriptor = {
            switch kind {
            case .FastestLap:
                return "Fastest Lap"
            default:
                return String(kind)
            }
        }()
        
        self.sessions = sessions
 
    }
    
    enum Country {
        case ABU, AUS, AUT, BEL, BHR, BRA, CAN, CHN, ESP, EUR, GBR, GER, HUN, ITA, JPN, MAL, MEX, MON, RUS, SIN, USA
    }
    
    enum Kind {
        case Qualifying
        case FastestLap
    }
    
}