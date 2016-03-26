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
    let timeInSeconds: Double
    var gap: Double? = nil
    
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
    
    enum TimeError: ErrorType {
        case ArrayWrongSize
        case CantConvertMinuteToInt
        case CantConvertSecondsMillisToInt
        case CantConvertMinuteToDouble
        case CantConvertSecondsMillisToDouble
    }
    
    init(name: Name, team: Team, time: String) {
        self.name = name
        self.team = team
        self.time = time
        self.timeInSeconds = {
            do {
                let timeComponents = time.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ":."))
                
                guard timeComponents.count == 3 else { throw TimeError.ArrayWrongSize }
                
                guard let minute = Double(timeComponents[0]) else { throw TimeError.CantConvertMinuteToDouble }
                
                let minutesAsMillis = minute * 60_000.0
                
                let secondsMilliString = timeComponents[1] + timeComponents[2]
                
                guard let secondsMilliInt = Double(secondsMilliString) else { throw TimeError.CantConvertSecondsMillisToDouble }
                
                let total = minutesAsMillis + secondsMilliInt
                
                return total
            } catch let error {
                fatalError(String(error))
            }
            }()
    }

}
