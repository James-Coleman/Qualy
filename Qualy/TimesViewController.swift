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
    
    var grandPrix: GrandPrix!
    
    var q3Backup: [Driver]! // Shouldn't it be possible to make this a let
    var q3Times: [Driver]!
    var q3DoubleTimes: [Double]!
    var q3Differences: [Double]!
    
    var q2Backup: [Driver]!
    var q2Times: [Driver]!
    var q2DoubleTimes: [Double]!
    var q2Differences: [Double]!
    
    var q1Backup: [Driver]!
    var q1Times: [Driver]!
    var q1DoubleTimes: [Double]!
    var q1Differences: [Double]!
    
    var qualyBackups: [[Driver]]!
    var qualyTimes: [[Driver]]!
    
    var closureArray: [() -> Void] = []
    
    var currentTime = NSDate.timeIntervalSinceReferenceDate()

    @IBAction func run(sender: AnyObject) {
        
        q3Times = []
        q2Times = []
        q1Times = []
        tableView.reloadData()
        
        let lastQ3Time = q3Differences.reverse()[0]
        let lastQ2Time = q2Differences.reverse()[0]
        
        currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        for (index, time) in q3Differences.enumerate() {
            
            closureArray.append( {
                self.q3Times.append(self.q3Backup[index])
//                self.tableView.reloadData()
                self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)], withRowAnimation: .Right)
                let difference = NSDate.timeIntervalSinceReferenceDate() - self.currentTime
                let error = time - difference
                print(time, "\t", difference, "\t", error, "\t", self.currentTime)
            })
            
            NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: #selector(runClosure), userInfo: index, repeats: false)
        }
        
        for (index, time) in q2Differences.enumerate() {
            closureArray.append({
                self.q2Times.append(self.q2Backup[index])
                self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 1)], withRowAnimation: .Right)
//                self.tableView.reloadData()
                self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: index, inSection: 1), atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)
            })
            
            NSTimer.scheduledTimerWithTimeInterval(time + lastQ3Time + 1, target: self, selector: #selector(runClosure), userInfo: index + q3Backup.count, repeats: false)
        }

        for (index, time) in q1Differences.enumerate() {
            closureArray.append( {
                self.q1Times.append(self.q1Backup[index])
                self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 2)], withRowAnimation: .Right)
//                self.tableView.reloadData()
                self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: index, inSection: 2), atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)
            })
            
            NSTimer.scheduledTimerWithTimeInterval(time + lastQ3Time + lastQ2Time + 2, target: self, selector: #selector(runClosure), userInfo: index + q3Backup.count + q2Backup.count, repeats: false)
        }
        
        
        print("\n")
 
    }
    
    func runClosure(timer: NSTimer) {
        let userInfoIndex = timer.userInfo as! Int
        closureArray[userInfoIndex]()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        q3Backup = grandPrix.q3
        q3Times = grandPrix.q3
        
        q2Backup = grandPrix.q2
        q2Times = grandPrix.q2
        
        q1Backup = grandPrix.q1
        q1Times = grandPrix.q1
        
        qualyBackups = [q3Backup, q2Backup, q1Backup]
        qualyTimes = [q3Times, q2Times, q1Times]
        
        q3DoubleTimes = q3Times.map({$0.timeInSeconds})
        
        q3Differences = q3DoubleTimes.map({($0 - q3DoubleTimes[0]) / 1000})
        
        q2DoubleTimes = q2Times.map({$0.timeInSeconds})
        
        q2Differences = q2DoubleTimes.map({($0 - q2DoubleTimes[0]) / 1000})
        
        q1DoubleTimes = q1Times.map({$0.timeInSeconds})
        
        q1Differences = q1DoubleTimes.map({($0 - q1DoubleTimes[0]) / 1000})
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
