//
//  MainPageTableViewController.swift
//  Sechand project
//
//  Created by levi on 2016/6/13.
//  Copyright © 2016年 levi. All rights reserved.
//

import UIKit
import SwiftyJSON

class TestTableViewController: UITableViewController {
    var numberOfRows = 0
    
    var namesArray = [String]()
    var pricesArray = [String]()
    var catagorysArray = [String]()
    var countsArray = [String]()
    var descriptionsArray = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJSON()
        
    }
    
    func parseJSON() {
        let url = NSURL(string: "http://140.119.19.114/sechand/product_read.php")
        let jsonData = NSData(contentsOfURL: url!) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        //let name = readableJSON[0]
        
        numberOfRows = readableJSON[].count
        
        for i in 0...(numberOfRows - 1) {
            let name = readableJSON[i]["name"].string as String!
            let price = readableJSON[i]["price"].string as String!
            let catagory = readableJSON[i]["catagory"].string as String!
            let count = readableJSON[i]["count"].string as String!
            let description = readableJSON[i]["description"].string as String!

            namesArray.append(name)
            pricesArray.append(price)
            catagorysArray.append(catagory)
            countsArray.append(count)
            descriptionsArray.append(description)
        }
        NSLog("\(namesArray)")
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfRows
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommodityCell", forIndexPath: indexPath) as! MainPageTableViewCell
        

        cell.nameLabel.text = namesArray[indexPath.row]
        cell.priceLabel.text = pricesArray[indexPath.row]
        cell.catagoryLabel.text = catagorysArray[indexPath.row]

        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "ShowCommodity" {
            guard let CommodityPageViewController = segue.destinationViewController as? CommodityPageViewController else {
                return
            }
            guard let cell = sender as? UITableViewCell else { return }
            let indexPath = self.tableView.indexPathForCell(cell)!
            CommodityPageViewController.name = namesArray[indexPath.row]
            CommodityPageViewController.price = pricesArray[indexPath.row]
            CommodityPageViewController.catagory = catagorysArray[indexPath.row]
            CommodityPageViewController.count = countsArray[indexPath.row]
            CommodityPageViewController.desc = descriptionsArray[indexPath.row]
        }
    }


    

}
