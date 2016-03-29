//
//  TimesViewController.swift
//  Qualy
//
//  Created by James Coleman on 23/03/2016.
//  Copyright © 2016 iSOS. All rights reserved.
//

import UIKit

class TimesViewController: UITableViewController {
    
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
    
    var differences: [[Double]]!

    @IBOutlet weak var runButton: UIBarButtonItem!
    @IBAction func run(sender: AnyObject) {
        for (index, _) in qualyTimes.enumerate() {
            qualyTimes[index] = []
        }
        
        tableView.reloadData()
        
        var lastDifferences = [0.0]
        
        let timeAtButtonTap = NSDate.timeIntervalSinceReferenceDate()
        
        for (sessionIndex, session) in differences.enumerate() {
            
            for (index, time) in session.enumerate() {
                let lastDifferenceSum = lastDifferences.reduce(0, combine: +)
                let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, timeAtButtonTap + lastDifferenceSum + time, 0, 0, 0, { (_) in
                    self.qualyTimes[sessionIndex].append(self.qualyBackups[sessionIndex][index])
                    self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: sessionIndex)], withRowAnimation: .Right)
                    self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: index, inSection: sessionIndex), atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)
                    
//                    let difference = NSDate.timeIntervalSinceReferenceDate() - timeAtButtonTap - lastDifferenceSum
//                    let error = time - difference
//                    print(time, "\t", difference, "\t", error, "\t", timeAtButtonTap, lastDifferenceSum)
                })
                
                CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
            }
            
            guard let last = differences[sessionIndex].last else { fatalError("\(differences[sessionIndex]) does not have a last value") }
            lastDifferences.append(last + 1)
        }
        
        runButton.enabled = false
        
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, timeAtButtonTap + lastDifferences.reduce(0, combine: +), 0, 0, 0) { (_) in
            self.runButton.enabled = true
        }
        
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
 
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
        
        differences = [q3Differences, q2Differences, q1Differences]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return qualyBackups.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let number = qualyBackups.count - section
        return "Q\(number)"
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qualyTimes[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DriverTableViewCell
        
        let section = indexPath.section
        let row = indexPath.row
        
        let driver = qualyTimes[section][row]
        
        cell.teamColour.backgroundColor = driver.teamColor
        cell.driverName.text = String(driver.name)
        cell.time.text = String(driver.time)
        cell.distanceToPole.text = "+ \(differences[section][row])"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
