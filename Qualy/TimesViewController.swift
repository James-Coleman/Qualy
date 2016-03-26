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
    
    var q3Backup: [Driver]! // Shouldn't it be possible to make this a let
    var q3Times: [Driver]!
    var q3Differences: [Double]!
    var q3FirstTime: Double?
    
    var q2Backup: [Driver]!
    var q2Times: [Driver]!
    var q2Differences: [Double]!
    var q2FirstTime: Double?
    
    var q1Backup: [Driver]!
    var q1Times: [Driver]!
    var q1Differences: [Double]!
    var q1FirstTime: Double?
    
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
        
        q3Differences = q3Times.map({ (input) -> Double in
            do {
                return try calculateDifference(input.time)
            } catch let error {
                fatalError(String(error))
            }
        })
        
        q2Differences = q2Times.map({ (input) -> Double in
            do {
                return try calculateDifference(input.time)
            } catch let error {
                fatalError(String(error))
            }
        })
        
        q1Differences = q1Times.map({ (input) -> Double in
            do {
                return try calculateDifference(input.time)
            } catch let error {
                fatalError(String(error))
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionHeadings.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeadings[section]
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return q3Times.count
        case 1:
            return q2Times.count
        case 2:
            return q1Times.count
        default:
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DriverTableViewCell
        
        let driver: Driver! = { switch indexPath.section {
        case 0:
            return q3Times[indexPath.row]
        case 1:
            return q2Times[indexPath.row]
        case 2:
            return q1Times[indexPath.row]
        default:
            return nil
            }
        }()
        
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
        case .Renault:
            return UIColor.yellowColor()
        case .ToroRosso:
            return UIColor.blueColor()
        case .Sauber:
            return UIColor.cyanColor()
        case .McLaren:
            return UIColor.grayColor()
        case .Manor:
            return UIColor.magentaColor()
        case .Haas:
            return UIColor.lightGrayColor()
            }
            }()
        
        cell.driverName.text = String(driver.name)
        cell.time.text = String(driver.time)
        
        cell.distanceToPole.text = { switch indexPath.section {
        case 0:
            return "+ \(q3Differences[indexPath.row])"
        case 1:
            return "+ \(q2Differences[indexPath.row])"
        case 2:
            return "+ \(q1Differences[indexPath.row])"
        default:
            return nil
            }
            }()
        
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
    
    func calculateDifference(input: String) throws -> Double {
        let array = input.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ":."))
        
        guard array.count == 3 else { throw StringToMilliError.ArrayWrongSize }
        
        guard let minute = Double(array[0]) else { throw StringToMilliError.CantConvertMinuteToDouble }
        
        let minutesAsMillis = minute * 60_000.0
        
        let secondsMilliString = array[1] + array[2]
        
        guard let secondsMilliInt = Double(secondsMilliString) else { throw StringToMilliError.CantConvertSecondsMillisToDouble }
        
        let total = minutesAsMillis + secondsMilliInt
        
        if let firstTimeDouble = q3FirstTime {
            let difference = total - firstTimeDouble
            let secondsDifference = difference / 1_000
            return secondsDifference
        } else {
            q3FirstTime = total
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
