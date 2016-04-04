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
        GrandPrix(location: .BHR, year: 2016, kind: .Qualifying, sessions: [[
            Driver(name: .HAM, team: .Mercedes,     time: "1:29.493"),
            Driver(name: .ROS, team: .Mercedes,     time: "1:29.570"),
            Driver(name: .VET, team: .Ferrari,      time: "1:30.012"),
            Driver(name: .RAI, team: .Ferrari,      time: "1:30.244"),
            Driver(name: .RIC, team: .RedBull,      time: "1:30.854"),
            Driver(name: .BOT, team: .Williams,     time: "1:31.153"),
            Driver(name: .MAS, team: .Williams,     time: "1:31.155"),
            Driver(name: .HUL, team: .ForceIndia,   time: "1:31.620")
            ],
            [
                Driver(name: .GRO, team: .Haas,         time: "1:31.756"),
                Driver(name: .VES, team: .ToroRosso,    time: "1:31.772"),
                Driver(name: .SAI, team: .ToroRosso,    time: "1:31.816"),
                Driver(name: .VAN, team: .McLaren,      time: "1:31.934"),
                Driver(name: .GUT, team: .Haas,         time: "1:31.945"),
                Driver(name: .BUT, team: .McLaren,      time: "1:31.998"),
                Driver(name: .KVY, team: .RedBull,      time: "1:32.241")
            ],
            [
                Driver(name: .WEH, team: .Manor,        time: "1:32.806"),
                Driver(name: .ERI, team: .Sauber,       time: "1:32.840"),
                Driver(name: .PER, team: .ForceIndia,   time: "1:32.911"),
                Driver(name: .MAG, team: .Renault,      time: "1:33.181"),
                Driver(name: .PAL, team: .Renault,      time: "1:33.438"),
                Driver(name: .HAR, team: .Manor,        time: "1:34.190"),
                Driver(name: .NAS, team: .Sauber,       time: "1:34.388")
            ]]),
        
        GrandPrix(
            location: GrandPrix.Country.AUS,
            year: 2016,
            kind: GrandPrix.Kind.Qualifying,
            sessions: [[
                Driver(name: Driver.Name.HAM, team: Driver.Team.Mercedes,   time: "1:23.837"),
                Driver(name: Driver.Name.ROS, team: Driver.Team.Mercedes,   time: "1:24.197"),
                Driver(name: Driver.Name.VET, team: Driver.Team.Ferrari,    time: "1:24.675"),
                Driver(name: Driver.Name.RAI, team: Driver.Team.Ferrari,    time: "1:25.033"),
                Driver(name: Driver.Name.VES, team: Driver.Team.ToroRosso,  time: "1:25.434"),
                Driver(name: Driver.Name.MAS, team: Driver.Team.Williams,   time: "1:25.458"),
                Driver(name: Driver.Name.SAI, team: Driver.Team.ToroRosso,  time: "1:25.582"),
                Driver(name: Driver.Name.RIC, team: Driver.Team.RedBull,    time: "1:25.589")
            ],
            [
                Driver(name: Driver.Name.PER, team: Driver.Team.ForceIndia, time: "1:25.753"),
                Driver(name: Driver.Name.HUL, team: Driver.Team.ForceIndia, time: "1:25.865"),
                Driver(name: Driver.Name.BOT, team: Driver.Team.Williams,   time: "1:25.961"),
                Driver(name: Driver.Name.ALO, team: Driver.Team.McLaren,    time: "1:26.125"),
                Driver(name: Driver.Name.BUT, team: Driver.Team.McLaren,    time: "1:26.304"),
                Driver(name: Driver.Name.PAL, team: Driver.Team.Renault,    time: "1:27.601"),
                Driver(name: Driver.Name.MAG, team: Driver.Team.Renault,    time: "1:27.742")
            ],
            [
                Driver(name: Driver.Name.ERI, team: Driver.Team.Sauber,     time: "1:27.435"),
                Driver(name: Driver.Name.NAS, team: Driver.Team.Sauber,     time: "1:27.958"),
                Driver(name: Driver.Name.KVY, team: Driver.Team.RedBull,    time: "1:28.006"),
                Driver(name: Driver.Name.GRO, team: Driver.Team.Haas,       time: "1:28.322"),
                Driver(name: Driver.Name.GUT, team: Driver.Team.Haas,       time: "1:29.606"),
                Driver(name: Driver.Name.HAR, team: Driver.Team.Manor,      time: "1:29.627"),
                Driver(name: Driver.Name.WEH, team: Driver.Team.Manor,      time: "1:29.642")
            ]]),
        
        GrandPrix(location: .AUS, year: 2016, kind: .FastestLap, sessions: [[
            Driver(name: .RIC, team: .RedBull,      time: "1:28.997"),
            Driver(name: .VET, team: .Ferrari,      time: "1:29.951"),
            Driver(name: .ROS, team: .Mercedes,     time: "1:30.557"),
            Driver(name: .HAM, team: .Mercedes,     time: "1:30.646"),
            Driver(name: .RAI, team: .Ferrari,      time: "1:30.701"),
            Driver(name: .VES, team: .ToroRosso,    time: "1:31.516"),
            Driver(name: .SAI, team: .ToroRosso,    time: "1:31.671"),
            Driver(name: .BUT, team: .McLaren,      time: "1:31.684"),
            Driver(name: .MAS, team: .Williams,     time: "1:32.288"),
            Driver(name: .MAG, team: .Renault,      time: "1:32.452"),
            Driver(name: .ALO, team: .McLaren,      time: "1:32.553"),
            Driver(name: .WEH, team: .Manor,        time: "1:32.673"),
            Driver(name: .NAS, team: .Sauber,       time: "1:32.711"),
            Driver(name: .BOT, team: .Williams,     time: "1:32.725"),
            Driver(name: .PER, team: .ForceIndia,   time: "1:32.780"),
            Driver(name: .HUL, team: .ForceIndia,   time: "1:32.833"),
            Driver(name: .GRO, team: .Haas,         time: "1:32.862"),
            Driver(name: .PAL, team: .Renault,      time: "1:32.955"),
            Driver(name: .GUT, team: .Haas,         time: "1:32.998"),
            Driver(name: .HAR, team: .Manor,        time: "1:33.847"),
            Driver(name: .ERI, team: .Sauber,       time: "1:33.892")
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
