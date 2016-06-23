//
//  loginViewController.swift
//  Sechand project
//
//  Created by Roy on 2016/6/15.
//  Copyright © 2016年 levi. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    
    var name:String = ""
    
    
    
    
    @IBOutlet weak var email: UITextField!
  
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func login(sender: AnyObject) {
        let userEmail = email.text!
        let userPassword = password.text!
        
        
        let userData = get(userEmail , password: userPassword)
        
        if(userData.containsString("true[]")){
            
            print("loginfail")
            
        }
        else{
            
            
            let start = userData.startIndex.advancedBy(14)
            let end = userData.startIndex.advancedBy(19)
            let range = start..<end
            name=userData.substringWithRange(range)
            print("loginsuccess")
            
            self.performSegueWithIdentifier("firstPage", sender: self)
            
            
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "firstPage" {
            guard let TabViewController = segue.destinationViewController as? TabViewController else {
                return
            }
            TabViewController.username = name
        }
    }

    
}




func get(email:String , password:String) -> String{
    let url = NSURL(string: "http://140.119.19.114/sechand/login_read.php/?email=\(email)&password=\(password)")
    let data = NSData(contentsOfURL: url!)
    //        let values = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
    
    let string : String = NSString(data: data!, encoding: NSUTF8StringEncoding)! as String
    
    return string
}


