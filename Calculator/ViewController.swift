//
//  ViewController.swift
//  Calculator
//
//  Created by Валерий Спиркин on 03.09.17.
//  Copyright © 2017 ThodProd. All rights reserved.
//

import Cocoa
var First: Double = 0
var Second: Double = 0
var Tree: Double = 0
var rootInv: Double = 0
var buttonN: Double = 1
var InvFirst = ""
var answer: Double = 0
var dotSwich = false
var swichSign = false
var swichMod = true
var swichMulti = false
var swichMinus = false
var swichMinesSign: String = ""
var keyButton = ""
var keyTup = ""

class ViewController: NSViewController {
    
    @IBOutlet weak var boxSimpe: NSBox!
    @IBOutlet weak var boxXY: NSBox!
    @IBOutlet weak var Result: NSTextField!
    @IBOutlet weak var boxSin: NSBox!
    
    
    @IBAction func sign(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        keyTup = (sender as! NSButton).title
        keyButton = keyTup
    }
    
    //oneTwoTree
    @IBAction func allSimbols(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
           }
    //end
    
    
    //Symbol
    
    @IBAction func Division(_ sender: Any) {
        if Result.stringValue == ""{}
            
        else
        {
            if swichSign == false
            {
                swichSign = true
                First = NSString(string: Result.stringValue).doubleValue
                Result.stringValue += (sender as! NSButton).title
                InvFirst = ""
                dotSwich = false
                
            }
        }
    }
    
    @IBAction func Multi(_ sender: Any) {
        if Result.stringValue == ""{}
        else
        {
            if swichSign == false
            {
                swichSign = true
                First = NSString(string: Result.stringValue).doubleValue
                
                Result.stringValue += (sender as! NSButton).title
                InvFirst = ""
                dotSwich = false
                
            }
        }
    }
    
    @IBAction func Minus(_ sender: Any) {
        if (keyTup != "") && (Second == 0)
        {
            if swichMinus == false
            {
                Result.stringValue += "("
                Result.stringValue += (sender as! NSButton).title
                InvFirst = "-"
                swichMinus = true
            }
        }
        else
        {
            First = NSString(string: Result.stringValue).doubleValue
            Result.stringValue += (sender as! NSButton).title
            InvFirst = ""
            dotSwich = false
            
        }
        
    }
    
    @IBAction func Plus(_ sender: Any) {
        if Result.stringValue == ""{}
        else
        {
            if swichSign == false
            {
                swichSign = true
                First = NSString(string: Result.stringValue).doubleValue
                Result.stringValue += (sender as! NSButton).title
                InvFirst = ""
                dotSwich = false
                
            }
        }
    }
    
    @IBAction func Dot(_ sender: Any) {
        if dotSwich == false
        {
            dotSwich = true
            if (Result.stringValue == "")
            {
                Result.stringValue = "0" + (sender as! NSButton).title
                InvFirst += "0."
                
            }
            else if InvFirst != ""
            {
                Result.stringValue += (sender as! NSButton).title
                InvFirst += "."
                
            }
            else
            {
                Result.stringValue += "0" + (sender as! NSButton).title
                InvFirst += "0."
                
            }
            
            
        }
    }
    
    
    @IBAction func Brackets(_ sender: Any) {
        if Result.stringValue == ""
        {
            Result.stringValue += "("
            
        }
        else if Result.stringValue != ""
        {
            Result.stringValue += ")"
            
        }
        
    }
    
    @IBAction func Root(_ sender: Any) {
        rootInv = NSString(string: Result.stringValue).doubleValue
        if rootInv < 0 {}
        else
        {
            let rootToAr = "\(sqrt(rootInv))"
            let rootArray = rootToAr.components(separatedBy: ".")
            if rootArray[1] == "0"
            {
                Result.stringValue = "\(rootArray[0])"
                
            }
            else
            {
                Result.stringValue = "\(sqrt(rootInv))"
                
            }
        }
    }
    
    @IBAction func squared(_ sender: Any) {
        rootInv = NSString(string: Result.stringValue).doubleValue
        let squToAr = "\(pow(rootInv, 2))"
        let squArray = squToAr.components(separatedBy: ".")
        if squArray[1] == "0"
        {
            Result.stringValue = "\(squArray[0])"
            
        }
        else
        {
            Result.stringValue = "\(pow(rootInv, 2))"
            
        }
    }
    
    @IBAction func squaredN(_ sender: Any) {
        swichMulti = true
        rootInv = NSString(string: Result.stringValue).doubleValue
        Result.stringValue += "ˆ("
        InvFirst = ""
        if InvFirst == ""{}
    }
    
    @IBAction func percent(_ sender: Any) {
        if Result.stringValue == ""{}
        else
        {
            rootInv = NSString(string: Result.stringValue).doubleValue
            Result.stringValue = "\(rootInv / 100)"
            
        }
        
    }
    
    
    
    
    
    
    
    
    //end
    
    //func
    
    @IBAction func plusMinus(_ sender: Any) {
        var refrashSimbol = 0
        
        if keyTup == ""
        {
            if Result.stringValue == ""
            {
                Result.stringValue += "-"
                
            }
            else if Result.stringValue == "-"
            {
                Result.stringValue = ""
                
            }
            else
            {
                refrashSimbol = Int(NSString(string: Result.stringValue).intValue)
                refrashSimbol = -refrashSimbol
                Result.stringValue = "\(refrashSimbol)"
                answer = -answer
                Tree = -Tree
                
            }
        }
        else
        {
            refrashSimbol = Int(NSString(string: InvFirst).intValue)
            refrashSimbol = -refrashSimbol
            answer = -answer
            Tree = -Tree
            
        }
    }
    
    
    
    
    @IBAction func Clear(_ sender: Any) {
        Result.stringValue = ""
        InvFirst = ""
        First = 0
        Second = 0
        Tree = 0
        answer = 0
        dotSwich = false
        swichSign = false
        rootInv = 0
        swichMulti = false
        keyTup = ""
        keyButton = ""
    }
    
    
    @IBAction func BackSpase(_ sender: Any) {
        if Result.stringValue == "" {}
        else
        {
            
            if keyTup == ""
            {
                let clearVarRes = Result.stringValue
                Result.stringValue.remove(at: clearVarRes.index(before: clearVarRes.endIndex))
            }
            else
            {
                let clearVar = Result.stringValue
                let clearVarToArr = "\(clearVar)"
                let clearVarArray = clearVarToArr.components(separatedBy: keyTup)
                if clearVarArray[1] == ""
                {
                    let clearVarRes = Result.stringValue
                    Result.stringValue.remove(at: clearVarRes.index(before: clearVarRes.endIndex))
                    keyTup = ""
                    swichSign = false
                }else{
                    let clearVarRes = Result.stringValue
                    Result.stringValue.remove(at: clearVarRes.index(before: clearVarRes.endIndex))
                }
            }
        }
    }
    
    //Finish
    
    
    @IBAction func Finish(_ sender: Any) {
        if Result.stringValue != ""{
            let swichResult = "\(Result.stringValue)"
            let swichResultArray = swichResult.components(separatedBy: keyTup)
            if (swichResultArray[0] != "") && (swichResultArray[1] != "") || (swichResultArray[0] != "") && (swichResultArray[1] != nil)
            {
            First = NSString(string: swichResultArray[0]).doubleValue
            Second = NSString(string: swichResultArray[1]).doubleValue
            switch keyButton {
            case "÷" :  answer = First / Second
            case "*" : answer = First * Second
            case "+" : answer = First + Second
            case "-" : answer = First - Second
            default: break
            }
            let zeroRes = "\(answer)"
            var zeroResArray = zeroRes.components(separatedBy: ".")
            if zeroResArray[1] == "0" {
                Result.stringValue = "\(zeroResArray[0])"
            }
            else
            {
                Result.stringValue = "\(answer)"}
            }
            else{}
        }    }
    
    
    //end
    
    //Mod
    
    
    @IBAction func Simple(_ sender: Any) {
        boxXY.isHidden = true
        boxSin.isHidden = true
        boxSimpe.frame.origin.y = 70
        boxSimpe.frame.origin.x = 20
        Result.frame.origin.y = 309
        Result.frame.origin.x = 20
        
        
        
    }
    
    @IBAction func Engineering(_ sender: Any) {
        boxXY.isHidden = false
        boxSin.isHidden = false
        boxSimpe.frame.origin.y = 25
        boxSimpe.frame.origin.x = 20
        Result.frame.origin.y = 309
        Result.frame.origin.x = 20
        boxXY.frame.origin.y = 259
        boxXY.frame.origin.x = 20
        
        
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

