//
//  RegisterPageViewController.swift
//  Sechand project
//
//  Created by Ｎiki25672729 on 5/6/16.
//  Copyright © 2016 levi. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    @IBAction func CancleButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true) {}
    }
    
    @IBOutlet weak var user_Name: UITextField!
    
    @IBOutlet weak var user_email: UITextField!
        
    @IBOutlet weak var user_password: UITextField!
    
    
    @IBOutlet weak var information_label: UILabel!
    
    @IBAction func registerator(sender: AnyObject) {
        let name = user_Name.text
        
        let email = user_email.text
        
        let password = user_password.text
        
        if(name!.isEmpty || email!.isEmpty || password!.isEmpty)
        {
            
            // Display alert message
            
            information_label.text = "something are empty , finish it"
            
            return;
        }
            
            
        else{
            
            let url:NSURL = NSURL(string: "http://140.119.19.114/sechand/login_insert.php")!
            let session = NSURLSession.sharedSession()
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            
            let paramString = "name=\(name!)&email=\(email!)&password=\(password!)"
            request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = session.dataTaskWithRequest(request) {
                (
                let data, let response, let error) in
                
                guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                    print("error")
                    return
                }
                
                
                let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(dataString)
            }
            
            
            task.resume()
            
            
            self.performSegueWithIdentifier("loginView", sender: self)
        }
        

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "firstPage" {
            guard let TabViewController = segue.destinationViewController as? TabViewController else {
                return
            }
            TabViewController.username = user_Name.text!
        }
    }

    
        
}


