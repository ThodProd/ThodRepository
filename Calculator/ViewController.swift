//
//  ViewController.swift
//  Calculator
//
//  Created by Валерий Спиркин on 03.09.17.
//  Copyright © 2017 ThodProd. All rights reserved.
//

import Cocoa
var theZnak = "+"
var theFirst = "0"
var theSecond = "0"
var theInvFirst = "0"
var theOtvet = "0"

class ViewController: NSViewController {
    
    
    
    @IBOutlet weak var theResult: NSTextField!
    
    //oneTwoTre
    @IBAction func theZero(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "0"
        theInvFirst = theInvFirst + "0"
    }
    
    @IBAction func theOne(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "1"
        theInvFirst = theInvFirst + "1"
    }
    
    @IBAction func theTwo(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "2"
        theInvFirst = theInvFirst + "2"
    }
    
    @IBAction func theThree(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "3"
        theInvFirst = theInvFirst + "3"
    }
    
    @IBAction func theFour(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "4"
        theInvFirst = theInvFirst + "4"
    }
    
    @IBAction func theFive(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "5"
        theInvFirst = theInvFirst + "5"
    }
    
    @IBAction func theSix(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "6"
        theInvFirst = theInvFirst + "6"
    }
    
    @IBAction func theSeven(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "7"
        theInvFirst = theInvFirst + "7"
    }
    
    @IBAction func theEight(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "8"
        theInvFirst = theInvFirst + "8"
    }
    
    @IBAction func theNine(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "9"
        theInvFirst = theInvFirst + "9"
    }
    
    //end
    
    
    //Symbol
    
    @IBAction func theDegree(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "/"
        theZnak = "/"
        theFirst = theResult.stringValue
        theInvFirst = ""
    }
    
    @IBAction func theMulti(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "*"
        theZnak = "*"
        theFirst = theResult.stringValue
        theInvFirst = ""
    }
    
    @IBAction func theMinus(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "-"
        theZnak = "-"
        theFirst = theResult.stringValue
        theInvFirst = ""
    }
    
    @IBAction func thePlus(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "+"
        theZnak = "+"
        theFirst = theResult.stringValue
        theInvFirst = ""
    }
    
    @IBAction func theDot(_ sender: Any) {
        theResult.stringValue = theResult.stringValue + "."
    }
    
    @IBAction func theBrackets(_ sender: Any) {
        if theResult.stringValue == "" {
        theResult.stringValue = theResult.stringValue + "("
        }
        else if theResult.stringValue != ""{
        theResult.stringValue = theResult.stringValue + ")"
        }
        
    }
    
    //end
    
    //func
    
    @IBAction func theClear(_ sender: Any) {
        theResult.stringValue = ""
        theInvFirst = ""
        theFirst = ""
        theSecond = ""
        
    }
    
    @IBAction func theBackSpase(_ sender: Any) {
        if theResult.stringValue == ""
        {
            
        }
        else
        {
        var theClearVar = theResult.stringValue
        theClearVar.remove(at: theClearVar.index(before: theClearVar.endIndex))
        theResult.stringValue = theClearVar
    }
    }
    
    //Finish
    
    @IBAction func theFinish(_ sender: Any) {
        if theZnak == "/" {
        
        }
        
        
    }
    
    
    
    //end
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

