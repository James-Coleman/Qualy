//
//  DriverTableViewCell.swift
//  Qualy
//
//  Created by James Coleman on 25/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class DriverTableViewCell: UITableViewCell {

    @IBOutlet weak var teamColour: UIView!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var distanceToPole: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        self.time.font = UIFont.monospacedDigitSystemFontOfSize(17.0, weight: UIFontWeightRegular)
        self.distanceToPole.font = UIFont.monospacedDigitSystemFontOfSize(17.0, weight: UIFontWeightRegular)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
}
