//
//  CommodityPageViewController.swift
//  Sechand project
//
//  Created by levi on 2016/6/13.
//  Copyright © 2016年 levi. All rights reserved.
//

import UIKit

class CommodityPageViewController: UIViewController {

    @IBOutlet weak var commodityName: UILabel!
    @IBOutlet weak var commodityPrice: UILabel!
    @IBOutlet weak var commodityCatagory: UILabel!
    @IBOutlet weak var commodityCount: UILabel!
    @IBOutlet weak var commodityDescription: UILabel!
    
    var name = String()
    var price = String()
    var catagory = String()
    var count = String()
    var desc = String()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.updateValues()
    }
    
    func updateValues() {
        guard self.isViewLoaded() else {
            return
        }
        
        self.commodityName.text = name
        self.commodityPrice.text = price
        self.commodityCatagory.text = catagory
        self.commodityCount.text = count
        self.commodityDescription.text = desc

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
