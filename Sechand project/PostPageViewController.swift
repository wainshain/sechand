//
//  PostPageViewController.swift
//  Sechand project
//
//  Created by levi on 2016/6/13.
//  Copyright © 2016年 levi. All rights reserved.
//

import UIKit

class PostPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func postButton(sender: AnyObject) {
        add_product()
        postDone(sender)
    }
    
    @IBOutlet weak var postName: UITextField!
    
    @IBOutlet weak var postPrice: UITextField!
    
    @IBOutlet weak var postCatagory: UITextField!

    @IBOutlet weak var postDict: UITextView!
    
    @IBAction func postDone(sender: AnyObject) {
        performSegueWithIdentifier("postDone", sender: sender)
    }
    
    func add_product(){
        
        let url:NSURL = NSURL(string: "http://140.119.19.114/sechand/product_write.php")!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let paramString = "name=\(postName.text!)&catagory=\(postCatagory.text!)&price=\(postPrice.text!)&count=0&description=\(postDict.text)"
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
