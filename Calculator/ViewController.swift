//
//  ViewController.swift
//  Calculator
//
//  Created by Валерий Спиркин on 03.09.17.
//  Copyright © 2017 ThodProd. All rights reserved.
//

import Cocoa
var sign = ""
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

class ViewController: NSViewController {
    
    @IBOutlet weak var boxSimpe: NSBox!
    @IBOutlet weak var boxXY: NSBox!
    @IBOutlet weak var Result: NSTextField!

    //oneTwoTree
    @IBAction func allSimbols(_ sender: Any) {
        if Result.stringValue == "nil" || Result.stringValue == "0"
        {
            Result.stringValue = ""
        
        }
        else
        {
            Result.stringValue += (sender as! NSButton).title
            InvFirst += (sender as! NSButton).title
        }
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
            sign = "/"
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
            sign = "*"
            InvFirst = ""
            dotSwich = false
            
        }
        }
    }
    
    @IBAction func Minus(_ sender: Any) {
        if (sign != "") && (Second == 0)
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
            sign = "-"
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
            sign = "+"
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
    
        if sign == ""
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
        sign = ""
        rootInv = 0
        swichMulti = false

    }
    
    
    @IBAction func BackSpase(_ sender: Any) {
        if Result.stringValue == "" {}
        else
        {
        
        if sign == ""
        {
            let clearVarRes = Result.stringValue
            Result.stringValue.remove(at: clearVarRes.index(before: clearVarRes.endIndex))
        }
        else
        {
        let clearVar = Result.stringValue
        let clearVarToArr = "\(clearVar)"
        let clearVarArray = clearVarToArr.components(separatedBy: sign)
        if clearVarArray[1] == ""
        {
        let clearVarRes = Result.stringValue
        Result.stringValue.remove(at: clearVarRes.index(before: clearVarRes.endIndex))
            sign = ""
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
        if swichMulti == true
        {
            buttonN = NSString(string: InvFirst).doubleValue
            let nToAr = "\(pow(rootInv,buttonN))"
            let nArray = nToAr.components(separatedBy: ".")
            Result.stringValue = "\(nArray[0])"
            swichMulti = false
            
        }
        else
        {
        if Result.stringValue == "" || Result.stringValue == "nil" {Result.stringValue = "nil"
            
        }
        else
        {
            swichSign = false
            Second = NSString(string: InvFirst).doubleValue
        
        if answer == 0 {
        if sign == "/"
        {
            answer = (First) / (Second)
            
        }
        if sign == "*"
        {
            answer = (First) * (Second)
            
        }
        if sign == "+"
        {
            answer = First + Second
            
        }
        if sign == "-"
        {
            answer = First - Second
            
        }
        let simpleOtvet = "\(answer)"
        let simplOtverArray = simpleOtvet.components(separatedBy: ".")
        if simplOtverArray[1] == "0"
        {
            Result.stringValue = "\(simplOtverArray[0])"
            Tree = answer
            InvFirst = ""
            sign = ""
            
        }
        else
        {
        Result.stringValue = "\(answer)"
        sign = ""
            
        
        }
        }
        else
        {
        if sign == "/"
        {
            answer = (Tree) / (Second)
            
        }
        if sign == "*"
        {
            answer = (Tree) * (Second)
            
        }
        if sign == "+"
        {
            answer = Tree + Second
            
        }
        if sign == "-"
        {
            answer = Tree - Second
            
        }
        let simpleOtvet = "\(answer)"
        let simplOtverArray = simpleOtvet.components(separatedBy: ".")
        if simplOtverArray[1] == "0"
        {
            Result.stringValue = "\(simplOtverArray[0])"
            Tree = answer
            sign = ""
            
        }
        else
        {
            Result.stringValue = "\(answer)"
            sign = ""
            
        
        }
        }
        }
        }
    }
    
    
    //end
    
    //Mod
    
    
    @IBAction func Simple(_ sender: Any) {
        boxXY.isHidden = true
        boxSimpe.frame.origin.y = 44
        boxSimpe.frame.origin.x = 20
        Result.frame.origin.y = 180
        Result.frame.origin.x = 20

        
        
    }
    
    @IBAction func Engineering(_ sender: Any) {
        boxXY.isHidden = false
        boxSimpe.frame.origin.y = 20
        boxSimpe.frame.origin.x = 20
        Result.frame.origin.y = 180
        Result.frame.origin.x = 20
        boxXY.frame.origin.y = 150
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

