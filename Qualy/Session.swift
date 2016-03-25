//
//  Session.swift
//  Qualy
//
//  Created by James Coleman on 25/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class Session: NSObject {
    
    let q1: [Driver]
    let q2: [Driver]
    let q3: [Driver]
    
    init(q1: [Driver], q2: [Driver], q3: [Driver]) {
        self.q1 = q1
        self.q2 = q2
        self.q3 = q3
    }

}
