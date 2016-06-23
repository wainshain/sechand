//
//  TestViewController.swift
//  Sechand project
//
//  Created by levi on 2016/6/16.
//  Copyright © 2016年 levi. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    
    var numberOfRows = 0
    
    var namesArray = [String]()
    var pricesArray = [String]()
    var catagorysArray = [String]()
    var countsArray = [String]()
    var descriptionsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        parseJSON()
        
        
        // Do any additional setup after loading the view.
    }
    
    
//    func reloadTable(){
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            self.mainTableView.reloadData()
//        })
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseJSON() {
        let url = NSURL(string: "http://140.119.19.114/sechand/product_read.php")
        let jsonData = NSData(contentsOfURL: url!) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        //let name = readableJSON[0]
        
        numberOfRows = readableJSON[].count
        
        for i in 0...(numberOfRows - 1) {
            let name = readableJSON[numberOfRows-1-i]["name"].string as String!
            let price = readableJSON[numberOfRows-1-i]["price"].string as String!
            let catagory = readableJSON[numberOfRows-1-i]["catagory"].string as String!
            let count = readableJSON[numberOfRows-1-i]["count"].string as String!
            let description = readableJSON[numberOfRows-1-i]["description"].string as String!
            
            namesArray.append(name)
            pricesArray.append(price)
            catagorysArray.append(catagory)
            countsArray.append(count)
            descriptionsArray.append(description)
        }
        NSLog("\(namesArray)")
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommodityCell", forIndexPath: indexPath) as! MainPageTableViewCell
        
        
        cell.nameLabel.text = namesArray[indexPath.row]
        cell.priceLabel.text = pricesArray[indexPath.row]
        cell.catagoryLabel.text = catagorysArray[indexPath.row]
        
        
        return cell
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
