//
//  QualyTableViewController.swift
//  Qualy
//
//  Created by James Coleman on 23/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class QualyTableViewController: UITableViewController {
    
    let grandsPrix = [
        GrandPrix(
            location: GrandPrix.Country.AUS,
            year: 2016,
            kind: GrandPrix.Kind.Qualifying,
            sessions: [[
                Driver(name: Driver.Name.HAM, team: Driver.Team.Mercedes,   minutes: 1, seconds: 23.837),
                Driver(name: Driver.Name.ROS, team: Driver.Team.Mercedes,   minutes: 1, seconds: 24.197),
                Driver(name: Driver.Name.VET, team: Driver.Team.Ferrari,    minutes: 1, seconds: 24.675),
                Driver(name: Driver.Name.RAI, team: Driver.Team.Ferrari,    minutes: 1, seconds: 25.033),
                Driver(name: Driver.Name.VES, team: Driver.Team.ToroRosso,  minutes: 1, seconds: 25.434),
                Driver(name: Driver.Name.MAS, team: Driver.Team.Williams,   minutes: 1, seconds: 25.458),
                Driver(name: Driver.Name.SAI, team: Driver.Team.ToroRosso,  minutes: 1, seconds: 25.582),
                Driver(name: Driver.Name.RIC, team: Driver.Team.RedBull,    minutes: 1, seconds: 25.589)
            ],
            [
                Driver(name: Driver.Name.PER, team: Driver.Team.ForceIndia, minutes: 1, seconds: 25.753),
                Driver(name: Driver.Name.HUL, team: Driver.Team.ForceIndia, minutes: 1, seconds: 25.865),
                Driver(name: Driver.Name.BOT, team: Driver.Team.Williams,   minutes: 1, seconds: 25.961),
                Driver(name: Driver.Name.ALO, team: Driver.Team.McLaren,    minutes: 1, seconds: 26.125),
                Driver(name: Driver.Name.BUT, team: Driver.Team.McLaren,    minutes: 1, seconds: 26.304),
                Driver(name: Driver.Name.PAL, team: Driver.Team.Renault,    minutes: 1, seconds: 27.601),
                Driver(name: Driver.Name.MAG, team: Driver.Team.Renault,    minutes: 1, seconds: 27.742)
            ],
            [
                Driver(name: Driver.Name.ERI, team: Driver.Team.Sauber,     minutes: 1, seconds: 27.435),
                Driver(name: Driver.Name.NAS, team: Driver.Team.Sauber,     minutes: 1, seconds: 27.958),
                Driver(name: Driver.Name.KVY, team: Driver.Team.RedBull,    minutes: 1, seconds: 28.006),
                Driver(name: Driver.Name.GRO, team: Driver.Team.Haas,       minutes: 1, seconds: 28.322),
                Driver(name: Driver.Name.GUT, team: Driver.Team.Haas,       minutes: 1, seconds: 29.606),
                Driver(name: Driver.Name.HAR, team: Driver.Team.Manor,      minutes: 1, seconds: 29.627),
                Driver(name: Driver.Name.WEH, team: Driver.Team.Manor,      minutes: 1, seconds: 29.642)
            ]]),
        
        GrandPrix(location: .AUS, year: 2016, kind: .FastestLap, sessions: [[
            Driver(name: .RIC, team: .RedBull,      minutes: 1, seconds: 28.997),
            Driver(name: .VET, team: .Ferrari,      minutes: 1, seconds: 29.951),
            Driver(name: .ROS, team: .Mercedes,     minutes: 1, seconds: 30.557),
            Driver(name: .HAM, team: .Mercedes,     minutes: 1, seconds: 30.646),
            Driver(name: .RAI, team: .Ferrari,      minutes: 1, seconds: 30.701),
            Driver(name: .VES, team: .ToroRosso,    minutes: 1, seconds: 31.516),
            Driver(name: .SAI, team: .ToroRosso,    minutes: 1, seconds: 31.671),
            Driver(name: .BUT, team: .McLaren,      minutes: 1, seconds: 31.684),
            Driver(name: .MAS, team: .Williams,     minutes: 1, seconds: 32.288),
            Driver(name: .MAG, team: .Renault,      minutes: 1, seconds: 32.452),
            Driver(name: .ALO, team: .McLaren,      minutes: 1, seconds: 32.553),
            Driver(name: .WEH, team: .Manor,        minutes: 1, seconds: 32.673),
            Driver(name: .NAS, team: .Sauber,       minutes: 1, seconds: 32.711),
            Driver(name: .BOT, team: .Williams,     minutes: 1, seconds: 32.725),
            Driver(name: .PER, team: .ForceIndia,   minutes: 1, seconds: 32.780),
            Driver(name: .HUL, team: .ForceIndia,   minutes: 1, seconds: 32.833),
            Driver(name: .GRO, team: .Haas,         minutes: 1, seconds: 32.862),
            Driver(name: .PAL, team: .Renault,      minutes: 1, seconds: 32.955),
            Driver(name: .GUT, team: .Haas,         minutes: 1, seconds: 32.998),
            Driver(name: .HAR, team: .Manor,        minutes: 1, seconds: 33.847),
            Driver(name: .ERI, team: .Sauber,       minutes: 1, seconds: 33.892)
            ]])
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
        
        cell.detailTextLabel?.text = grandPrix.kindDescriptor

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
        
        destination.grandPrix = grandPrix
    }

}
