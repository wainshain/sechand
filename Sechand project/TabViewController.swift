//
//  TabViewController.swift
//  Sechand project
//
//  Created by Niki25672729 on 6/15/16.
//  Copyright © 2016 levi. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    @IBOutlet weak var UsernameLabel: UILabel!
    
    var username: String = "" {
        didSet {
            guard self.isViewLoaded() else {
                return
            }
            
            UsernameLabel.text = username
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
