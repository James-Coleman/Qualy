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
<<<<<<< HEAD
    let teamColour: UIColor
    let minutes: Int
    let seconds: Double
    let totalTime: Double
=======
    let teamColor: UIColor
    let time: String
    let timeInSeconds: Double
>>>>>>> parent of 364cd75... Added [ unowned self ] to closures.
    
    enum Name {
        case ALO, BOT, BUT, ERI, GRO, GUT, HAM, HAR, HUL, KVY, MAG, MAS, NAS, PAL, PER, RAI, RIC, ROS, SAI, VES, VET, WEH
    }
    
    enum Team {
        case Ferrari, ForceIndia, Haas, Manor, McLaren, Mercedes, RedBull, Renault, Sauber, ToroRosso, Williams
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
        self.teamColor = {
            switch team {
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
<<<<<<< HEAD
        }
    }
    
    init(name: Name, team: Team, minutes: Int, seconds: Double) {
        self.name = name
        self.team = team
        self.teamColour = team.teamColour()
        self.minutes = minutes
        self.seconds = seconds
        self.totalTime = Double(minutes * 60) + seconds
=======
            }()
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
>>>>>>> parent of 364cd75... Added [ unowned self ] to closures.
    }

}
