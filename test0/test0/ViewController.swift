//
//  ViewController.swift
//  test0
//
//  Created by Michael Collins on 2017/07/25.
//  Copyright (c) 2017 Michael Collins. All rights reserved.
//

import UIKit
import Foundation

func returnTimes(multiplier: Int) -> (Int, Int)->Int {
    return {(value: Int, other: Int)->Int in
        return multiplier * value * other }
}

func times2(value: Int) -> Int {
    return value + value
}

func returnProcCompletion(label: UILabel) -> (Data?, URLResponse?, Error?)-> Void {
    return {(data: Data?, response: URLResponse?, error: Error?)->Void in
        DispatchQueue.main.async {
            if (error != nil) {
                label.text = "there was an error"
            } else {
                label.text = String(data: data!, encoding: .utf8)
            }
        }
    }
}
/*func procCompletion(data: Data?, response: URLResponse?, error: Error?) -> Void {
    if error == nil {

    }
}*/


class ViewController: UIViewController {
    
    // MARK: Properties
    var clickCount: Int! = 0
    @IBOutlet weak var theLabel: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func setTheLabelText(_ sender: UIButton) {
        
        clickCount = clickCount + 1
        //theLabel.text = String(returnTimes(multiplier: 2)(clickCount, 3))
        let sessionWithoutADelegate = URLSession.shared
        let url = URL(string: "http://localhost/basicRestaurantList")!
        let theTask = sessionWithoutADelegate.dataTask(with: url, completionHandler: returnProcCompletion(label: theLabel))
        theTask.resume()
        //theLabel.text = String(returnP  returnTimes(multiplier: 2)(clickCount, 3))
        /*if (clickCount % 2) == 0 {
            var newLabelValue: String! = "click count = "
            newLabelValue.append(String(clickCount))
            newLabelValue.append(" ")
            var area: Double = (Circle(diameter: clickCount)).area()
            newLabelValue.append(String(area))
            theLabel.text = newLabelValue
        }
        else {
            Circle(diameter: clickCount).areaAndLabel(labelControl: theLabel)
        }*/
    }
    

}
