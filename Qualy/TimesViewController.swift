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
    
    var qualyBackups: [[Driver]]!
    var qualyTimes: [[Driver]]!
    
    var doubleTimes: [[Double]]!
    
    var differences: [[Double]]!

    @IBOutlet weak var runButton: UIBarButtonItem!
    @IBAction func run(sender: AnyObject) {
        qualyTimes = qualyTimes.map({_ in []})
        
        tableView.reloadData()
        
        var lastDifferences = [0.0]
        
        let timeAtButtonTap = NSDate.timeIntervalSinceReferenceDate()
        
        for (sessionIndex, session) in differences.enumerate() {
            
            for (index, time) in session.enumerate() {
                let lastDifferenceSum = lastDifferences.reduce(0, combine: +)
                let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, timeAtButtonTap + lastDifferenceSum + time, 0, 0, 0, { [unowned self] (_) in
                    self.qualyTimes[sessionIndex].append(self.qualyBackups[sessionIndex][index])
                    self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: sessionIndex)], withRowAnimation: .Right)
                    self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: index, inSection: sessionIndex), atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)
                    
//                    let difference = NSDate.timeIntervalSinceReferenceDate() - timeAtButtonTap - lastDifferenceSum
//                    let error = time - difference
//                    print(time, "\t", difference, "\t", error, "\t", timeAtButtonTap, lastDifferenceSum)
                })
                
                CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
            }
            
            guard let lastDifference = differences[sessionIndex].last else { fatalError("\(differences[sessionIndex]) does not have a last value") }
            lastDifferences.append(lastDifference + 1)
        }
        
        runButton.enabled = false
        
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, timeAtButtonTap + lastDifferences.reduce(0, combine: +), 0, 0, 0) { [unowned self] (_) in
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
        
        title = "\(grandPrix.title) \(grandPrix.kindDescriptor)"
        
        qualyBackups = grandPrix.sessions
        qualyTimes = grandPrix.sessions
        
        doubleTimes = qualyBackups.map({$0.map({$0.timeInSeconds})})
        
        differences = doubleTimes.map({ (times) -> [Double] in
            return times.map({($0 - times[0]) / 1000})
        })
        
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
        switch grandPrix.kind {
        case .Qualifying:
            let number = qualyBackups.count - section
            return "Q\(number)"
        default:
            return nil
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qualyTimes[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DriverTableViewCell
        
        let section = indexPath.section
        let row = indexPath.row
        
        let driver = qualyTimes[section][row]
        
        cell.teamColour.backgroundColor = driver.teamColour
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
