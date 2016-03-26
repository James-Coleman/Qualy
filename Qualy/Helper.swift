//
//  Helper.swift
//  Qualy
//
//  Created by James Coleman on 26/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

//enum TimeError: ErrorType {
//    case ArrayWrongSize
//    case CantConvertMinuteToInt
//    case CantConvertSecondsMillisToInt
//    case CantConvertMinuteToDouble
//    case CantConvertSecondsMillisToDouble
//}
//
//func timeStringToDouble(time: String) throws -> Double {
//    let timeComponents = time.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ":."))
//    
//    guard timeComponents.count == 3 else { throw TimeError.ArrayWrongSize }
//    
//    guard let minute = Double(timeComponents[0]) else { throw TimeError.CantConvertMinuteToDouble }
//    
//    let minutesAsMillis = minute * 60_000.0
//    
//    let secondsMilliString = timeComponents[1] + timeComponents[2]
//    
//    guard let secondsMilliInt = Double(secondsMilliString) else { throw TimeError.CantConvertSecondsMillisToDouble }
//    
//    let total = minutesAsMillis + secondsMilliInt
//    
//    return total
//}
