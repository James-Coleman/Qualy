//
//  QualyTableViewController.swift
//  Qualy
//
//  Created by James Coleman on 23/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class QualyTableViewController: UITableViewController {
    
//    let grandsPrix = ["AUS 2016", "UAE 2015", "BRA 2015", "MEX 2015", "USA 2015", "RUS 2015", "JAP 2015", "SIN 2015", "ITA 2015", "BEL 2015", "HUN 2015", "GBR 2015", "AUS 2015", "CAN 2015", "MON 2015", "SPN 2015", "BAH 2015", "CHN 2015", "MAL 2015", "AUS 2015"]
    
    let grandsPrix = [
        GrandPrix(
            location: GrandPrix.Country.AUS,
            year: 2016,
            q3: [
                Driver(name: Driver.Name.HAM, team: Driver.Team.Mercedes,   time: "1.23.837"),
                Driver(name: Driver.Name.ROS, team: Driver.Team.Mercedes,   time: "1:24.197"),
                Driver(name: Driver.Name.VET, team: Driver.Team.Ferrari,    time: "1:24.675"),
                Driver(name: Driver.Name.RAI, team: Driver.Team.Ferrari,    time: "1:25.033"),
                Driver(name: Driver.Name.VES, team: Driver.Team.ToroRosso,  time: "1:25.434"),
                Driver(name: Driver.Name.MAS, team: Driver.Team.Williams,   time: "1:25.458"),
                Driver(name: Driver.Name.SAI, team: Driver.Team.ToroRosso,  time: "1:25.582"),
                Driver(name: Driver.Name.RIC, team: Driver.Team.RedBull,    time: "1:25.589")
            ],
            q2: [
                Driver(name: Driver.Name.PER, team: Driver.Team.ForceIndia, time: "1:25.753"),
                Driver(name: Driver.Name.HUL, team: Driver.Team.ForceIndia, time: "1:25.865"),
                Driver(name: Driver.Name.BOT, team: Driver.Team.Williams,   time: "1:25.961"),
                Driver(name: Driver.Name.ALO, team: Driver.Team.McLaren,    time: "1:26.125"),
                Driver(name: Driver.Name.BUT, team: Driver.Team.McLaren,    time: "1:26.304"),
                Driver(name: Driver.Name.PAL, team: Driver.Team.Renault,    time: "1.27:601"),
                Driver(name: Driver.Name.MAG, team: Driver.Team.Renault,    time: "1:27.742")
            ],
            q1: [
                Driver(name: Driver.Name.ERI, team: Driver.Team.Sauber,     time: "1:27.435"),
                Driver(name: Driver.Name.NAS, team: Driver.Team.Sauber,     time: "1:27.958"),
                Driver(name: Driver.Name.KVY, team: Driver.Team.RedBull,    time: "1:28.006"),
                Driver(name: Driver.Name.GRO, team: Driver.Team.Haas,       time: "1:28.322"),
                Driver(name: Driver.Name.GUT, team: Driver.Team.Haas,       time: "1:29.606"),
                Driver(name: Driver.Name.HAR, team: Driver.Team.Manor,      time: "1:29.627"),
                Driver(name: Driver.Name.WEH, team: Driver.Team.Manor,      time: "1:29.642")
            ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grandsPrix.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let grandPrix = grandsPrix[indexPath.row]
        
        cell.textLabel?.text = grandPrix.title

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destination = segue.destinationViewController as! TimesViewController
        
        let grandPrix = grandsPrix[(tableView.indexPathForSelectedRow?.item)!]
        
        destination.title = grandPrix.title
        
        destination.grandPrix = grandPrix
        
        
        
    }

}
