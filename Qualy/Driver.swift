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
    let teamColour: UIColor
    let minutes: Int
    let seconds: Double
    let totalTime: Double
    
    enum Name {
        case ALO, BOT, BUT, ERI, GRO, GUT, HAM, HAR, HUL, KVY, MAG, MAS, NAS, PAL, PER, RAI, RIC, ROS, SAI, VES, VET, WEH
    }
    
    enum Team {
        case Ferrari, ForceIndia, Haas, Manor, McLaren, Mercedes, RedBull, Renault, Sauber, ToroRosso, Williams
        
        func teamColour() -> UIColor {
            switch self {
            case .Ferrari:
                return UIColor(red: 0xC3 / 255, green: 0, blue: 0, alpha: 1)
            case .ForceIndia:
                return UIColor(red: 1, green: 0x5F / 255, blue: 0x0F / 255, alpha: 1)
            case .Haas:
                return UIColor(red: 0x6C / 255, green: 0, blue: 0, alpha: 1)
            case .Manor:
                return UIColor(red: 0x32 / 255, green: 0x32 / 255, blue: 0x32 / 255, alpha: 1)
            case .McLaren:
                return UIColor(white: 0x80 / 255, alpha: 1)
            case .Mercedes:
                return UIColor(red: 0x2A / 255, green: 0xB4 / 255, blue: 0xA5 / 255, alpha: 1)
            case .RedBull:
                return UIColor(red: 0, green: 0, blue: 0x7D / 255, alpha: 1)
            case .Renault:
                return UIColor(red: 1, green: 0xD8 / 255, blue: 0, alpha: 1)
            case .Sauber:
                return UIColor(red: 0, green: 0x6E / 255, blue: 1, alpha: 1)
            case .ToroRosso:
                return UIColor.blueColor()
            case .Williams:
                return UIColor.whiteColor()
            }
        }
    }
    
    init(name: Name, team: Team, minutes: Int, seconds: Double) {
        self.name = name
        self.team = team
        self.teamColour = team.teamColour()
        self.minutes = minutes
        self.seconds = seconds
        self.totalTime = Double(minutes * 60) + seconds
    }

}
