//
//  Driver.swift
//  Qualy
//
//  Created by James Coleman on 25/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class Driver: NSObject{
    let name: Name
    let team: Team
    let time: String
    
    enum Name {
        case HAM
        case ROS
        case VET
        case RAI
        case GRO
        case MAG
        case MAS
        case BOT
        case KVY
        case RIC
        case PER
        case HUL
        case BUT
        case ALO
        case GUT
        case PAL
        case WEH
        case HAR
        case ERI
        case NAS
        case VES
        case SAI
    }
    
    enum Team {
        case Mercedes
        case Ferrari
        case Williams
        case RedBull
        case ForceIndia
        case Renault
        case ToroRosso
        case Sauber
        case McLaren
        case Manor
        case Haas
    }
    
    init(name: Name, team: Team, time: String) {
        self.name = name
        self.team = team
        self.time = time
    }

}
