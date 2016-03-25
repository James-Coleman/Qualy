//
//  TimesViewController.swift
//  Qualy
//
//  Created by James Coleman on 23/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class TimesViewController: UITableViewController {
    
    var sectionHeadings = ["Q3", "Q2", "Q1"]
    
    var q3Backup: [Driver] = []
    
    var q3Times = [
        Driver(name: Driver.Name.HAM, team: Driver.Team.Mercedes, time: "1.23.837"),
        Driver(name: Driver.Name.ROS, team: Driver.Team.Mercedes, time: "1:24.197"),
        Driver(name: Driver.Name.VET, team: Driver.Team.Ferrari, time: "1:24.675"),
        Driver(name: Driver.Name.RAI, team: Driver.Team.Ferrari, time: "1:25.033"),
        Driver(name: Driver.Name.VES, team: Driver.Team.ToroRosso, time: "1:25.434"),
        Driver(name: Driver.Name.MAS, team: Driver.Team.Williams, time: "1:25.458"),
        Driver(name: Driver.Name.SAI, team: Driver.Team.ToroRosso, time: "1:25.582"),
        Driver(name: Driver.Name.RIC, team: Driver.Team.RedBull, time: "1:25.589")
    ]
    
    var q3Differences: [Double]!
    
    var firstTimeDouble: Double?
    
    enum StringToMilliError: ErrorType {
        case ArrayWrongSize
        case CantConvertMinuteToInt
        case CantConvertSecondsMillisToInt
        case CantConvertMinuteToDouble
        case CantConvertSecondsMillisToDouble
    }

    @IBAction func run(sender: AnyObject) {
        q3Times = []
        tableView.reloadData()
        
        for (index, time) in q3Differences.enumerate() {
            RunAfterDelay(time, block: {
                self.q3Times.append(self.q3Backup[index])
                self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)], withRowAnimation: .Right)
//                self.tableView.reloadData()
            })
        }
    }
    
    func RunAfterDelay(delay: NSTimeInterval, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue(), block)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        q3Backup = q3Times
        
        q3Differences = q3Times.map { (input) -> Double in
            do {
                return try stringToDoubleDifference(input.time)
            } catch let error {
                fatalError(String(error))
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeadings[section]
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return q3Times.count
        default:
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DriverTableViewCell
        
        let driver = q3Times[indexPath.row]
        
        cell.teamColour.backgroundColor = { switch driver.team {
        case .Mercedes:
            return UIColor.greenColor()
        case .Ferrari:
            return UIColor.redColor()
        case .Williams:
            return UIColor.whiteColor()
        case .RedBull:
            return UIColor.purpleColor()
        case .ForceIndia:
            return UIColor.orangeColor()
        case .Lotus:
            return UIColor.yellowColor()
        case .ToroRosso:
            return UIColor.blueColor()
        case .Sauber:
            return UIColor.cyanColor()
        case .McLaren:
            return UIColor.grayColor()
        case .Manor:
            return UIColor.magentaColor()
            }
            }()
        
        cell.driverName.text = String(driver.name)
        cell.time.text = String(driver.time)
        cell.distanceToPole.text = "+ \(q3Differences[indexPath.row])"
        
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
    
    func stringToDoubleDifference(input: String) throws -> Double {
        let array = input.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ":."))
        
        guard array.count == 3 else { throw StringToMilliError.ArrayWrongSize }
        
        guard let minute = Double(array[0]) else { throw StringToMilliError.CantConvertMinuteToDouble }
        
        let minutesAsMillis = minute * 60_000.0
        
        let secondsMilliString = array[1] + array[2]
        
        guard let secondsMilliInt = Double(secondsMilliString) else { throw StringToMilliError.CantConvertSecondsMillisToDouble }
        
        let total = minutesAsMillis + secondsMilliInt
        
        if let firstTimeDouble = firstTimeDouble {
            let difference = total - firstTimeDouble
            let secondsDifference = difference / 1_000
            return secondsDifference
        } else {
            firstTimeDouble = total
        }
        
        return 0.0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
