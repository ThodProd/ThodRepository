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
var answer: Double = 0
var dotSwich = false
var swichSign = false
var swichMod = true
var swichMulti = false
var swichMinus = false
var swichMinesSign: String = ""
var keyButton = ""
var keyTup = ""
var variable: Double = 0
var sinCosLn = ""
var sinVariable: Double = 0
var pi: Double = M_PI/180
var e: Double = M_E



class ViewController: NSViewController {
    
    @IBOutlet weak var boxSimpe: NSBox!
    @IBOutlet weak var boxXY: NSBox!
    @IBOutlet weak var Result: NSTextField!
    @IBOutlet weak var boxSin: NSBox!
    
    
    @IBAction func sign(_ sender: Any) {
        
        Result.stringValue += (sender as! NSButton).title
        keyTup = (sender as! NSButton).title
        keyButton = keyTup
        dotSwich = false
        if (keyTup == "sin") || keyTup == "cos" {Result.stringValue += "("}
    }
    
    //oneTwoTree
    @IBAction func allSimbols(_ sender: Any) {
        if Result.stringValue == "0"
        {
            Result.stringValue = ""
        }
        Result.stringValue += (sender as! NSButton).title
        variable += Double((sender as! NSButton).title)!
    }
    
    @IBAction func piM(_ sender: Any) {
        Result.stringValue = "\(M_PI)"
    }
    
    
    //end
    
    
    //Symbol
    
    @IBAction func sinCos(_ sender: Any) {
        if Result.stringValue == ""{}
        else
        {
            sinVariable = NSString(string: Result.stringValue).doubleValue
            sinCosLn = (sender as! NSButton).title
            
        }
        switch sinCosLn
        {
        case "sin" : answer = sin(sinVariable*pi)
        case "cos" : answer = cos(sinVariable*pi)
        case "tan" : answer = tan(sinVariable*pi)
        case "cot" : answer = cos(sinVariable*pi)/sin(sinVariable*pi)
        case "lg" : answer = log10(sinVariable)
        case "ln" : answer = log10(sinVariable)/log10(e)
        default: break
        }
        Result.stringValue = "\(answer)"
    }
    
    
    
    @IBAction func Minus(_ sender: Any) {
        if (keyTup != "") && (Second == 0)
        {
            if swichMinus == false
            {
                Result.stringValue += "("
                Result.stringValue += (sender as! NSButton).title
                swichMinus = true
            }
        }
        else
        {
            First = NSString(string: Result.stringValue).doubleValue
            Result.stringValue += (sender as! NSButton).title
            dotSwich = false
            
        }
        
    }
    
    
    @IBAction func Dot(_ sender: Any) {
        if dotSwich == false
        {
            dotSwich = true
            let dotArray = Result.stringValue.components(separatedBy: keyTup)
            if (Result.stringValue == "")
            {
                Result.stringValue = "0" + (sender as! NSButton).title
            }
            else if (keyTup != "") && (dotArray[1] == "")
            {
                Result.stringValue += "0" + (sender as! NSButton).title
                
            }
            else
            {
                Result.stringValue += (sender as! NSButton).title
                
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
        if swichMulti == false
        {
            swichMulti = true
            Result.stringValue += "ˆ("
        }
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
        if keyTup == ""
        {
            var swichPlus = NSString(string: Result.stringValue).intValue
            swichPlus = -swichPlus
            Result.stringValue = "\(swichPlus)"
        }
        else
        {
            let plusArray = Result.stringValue.components(separatedBy: keyTup)
            var secondAr = NSString(string: plusArray[1]).intValue
            secondAr = -secondAr
            Result.stringValue = plusArray[0] + "\(keyTup)" + "\(secondAr)"
            
        }
    }
    
    
    
    
    @IBAction func Clear(_ sender: Any) {
        Result.stringValue = ""
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
        variable = 0
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
            if keyTup == ""
            {
                let squaredNArray = Result.stringValue.components(separatedBy: "ˆ(")
                First = NSString(string: squaredNArray[0]).doubleValue
                Second = NSString(string: squaredNArray[1]).doubleValue
                answer = pow(First, Second)
                Result.stringValue = "\(answer)"
            }
            else
            {
                let swichResultArray = Result.stringValue.components(separatedBy: keyTup)
                if ((swichResultArray[0] != "") && (swichResultArray[1] == "0")) || ((keyTup != "" && swichResultArray[1] == ""))
                {
                    Result.stringValue.remove(at: Result.stringValue.index(before: Result.stringValue.endIndex))
                }
                else
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
                        keyTup = ""
                        dotSwich = false
                    }
                    else
                    {
                        Result.stringValue = "\(answer)"
                        keyTup = ""
                        dotSwich = false
                    }
                }
                
            }    }
    }
    
    
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

