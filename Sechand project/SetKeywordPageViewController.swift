//
//  SetKeywordPageViewController.swift
//  Sechand project
//
//  Created by levi on 2016/6/13.
//  Copyright © 2016年 levi. All rights reserved.
//

import UIKit

class SetKeywordPageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pricePickerView: UIPickerView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    
    let priceData:[String] = ["不限", "<100", "100~1000", "1000~5000", "5000~10000", "10000~20000", ">20000"]
    let categoryData:[String] = ["服飾", "傢俱", "書本", "食品", "藥妝", "3C", "其他"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pricePickerView.delegate = self
        pricePickerView.dataSource = self
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 7
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if pickerView.tag == 1010 {
            pickerLabel.text = priceData[row]
        }
        else {
            pickerLabel.text = categoryData[row]
        }
        
        return pickerLabel
    }

    @IBAction func clickSendButton(sender: AnyObject) {
        let dict = ["name" : nameTextField.text!, "price" : priceData[pricePickerView.selectedRowInComponent(0)], "category" : categoryData[categoryPickerView.selectedRowInComponent(0)]]
        
        //取得plist檔案路徑
        let paths:NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory: NSString = paths[0] as! NSString
        let filePath = documentsDirectory.stringByAppendingString("/Keyword.plist")
        
        let fileManager: NSFileManager = NSFileManager.defaultManager()
        var data: NSMutableArray
        
        //判斷plist檔案是否存在於對應位置
        if fileManager.fileExistsAtPath(filePath) {
            
            //讀取存在的plist檔案，之後等待覆寫
            data = NSMutableArray.init(contentsOfFile: filePath)!
            
        } else {
            
            //在對應位置中建立plist檔案
            data = NSMutableArray.init(array: [])
            
            
        }
        data.addObject(dict)
        
        //將plist檔案存入Document
        let alert: UIAlertController
        if data.writeToFile(filePath, atomically: true){
            alert = UIAlertController(title: "Success!", message: "關鍵字設定完成", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            alert = UIAlertController(title: "False!", message: "關鍵字設定失敗", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
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
