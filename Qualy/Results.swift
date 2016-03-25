//
//  Results.swift
//  Qualy
//
//  Created by James Coleman on 25/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class Results: NSObject {
    
    let result: Result
    
    let results = [
        Result.aus2016: [
            Session(q1: [
                ],
                q2: [
                Driver(name: Driver.Name.PER, team: Driver.Team.ForceIndia, time: "1:25.753"),
                Driver(name: Driver.Name.HUL, team: Driver.Team.ForceIndia, time: "1:25.865"),
                Driver(name: Driver.Name.BOT, team: Driver.Team.Williams, time: "1:25.961"),
                Driver(name: Driver.Name.ALO, team: Driver.Team.McLaren, time: "1:26.125"),
                Driver(name: Driver.Name.BUT, team: Driver.Team.McLaren, time: "1:26.304"),
                Driver(name: Driver.Name.PAL, team: Driver.Team.Renault, time: "1.27:601"),
                Driver(name: Driver.Name.MAG, team: Driver.Team.Renault, time: "1:27.742")
                ],
                q3: [
                Driver(name: Driver.Name.HAM, team: Driver.Team.Mercedes, time: "1.23.837"),
                Driver(name: Driver.Name.ROS, team: Driver.Team.Mercedes, time: "1:24.197"),
                Driver(name: Driver.Name.VET, team: Driver.Team.Ferrari, time: "1:24.675"),
                Driver(name: Driver.Name.RAI, team: Driver.Team.Ferrari, time: "1:25.033"),
                Driver(name: Driver.Name.VES, team: Driver.Team.ToroRosso, time: "1:25.434"),
                Driver(name: Driver.Name.MAS, team: Driver.Team.Williams, time: "1:25.458"),
                Driver(name: Driver.Name.SAI, team: Driver.Team.ToroRosso, time: "1:25.582"),
                Driver(name: Driver.Name.RIC, team: Driver.Team.RedBull, time: "1:25.589")
                ])
        ]
    ]
    
    init(result: Result) {
        self.result = result
    }
    
    enum Result {
        case aus2016
    }

}
