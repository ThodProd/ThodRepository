//
//  ViewController.swift
//  Calculator
//
//  Created by Валерий Спиркин on 03.09.17.
//  Copyright © 2017 ThodProd. All rights reserved.
//

import Cocoa
var Znak = ""
var First:Double = 0
var Second:Double = 0
var Tree:Double = 0
var rootInv:Double = 0
var buttonN:Double = 1
var InvFirst = ""
var Otvet:Double = 0
var dotSwich = false
var swichZnak = false
var swichMod = true
var swichMulti = false

class ViewController: NSViewController {
    
    @IBOutlet weak var boxSimpe: NSBox!
    @IBOutlet weak var boxXY: NSBox!
    @IBOutlet weak var Result: NSTextField!

    //oneTwoTree
    @IBAction func allSimbols(_ sender: Any) {
        if Result.stringValue == "nil" {Result.stringValue = ""}else{
        Result.stringValue += (sender as! NSButton).title
        InvFirst += (sender as! NSButton).title
    }
    }
    //end
    
    
    //Symbol
    
    @IBAction func Division(_ sender: Any) {
        if Result.stringValue == ""{}
        else{
        if swichZnak == false{
        swichZnak = true
        Result.stringValue += (sender as! NSButton).title
        Znak = "/"
        First = NSString(string: Result.stringValue).doubleValue
        InvFirst = ""
        dotSwich = false
            }
        }
    }
    
    @IBAction func Multi(_ sender: Any) {
        if Result.stringValue == ""{}
        else{
        if swichZnak == false{
        swichZnak = true
        Result.stringValue += (sender as! NSButton).title
        Znak = "*"
        First = NSString(string: Result.stringValue).doubleValue
        InvFirst = ""
        dotSwich = false
        }
        }
    }
    
    @IBAction func Minus(_ sender: Any) {
        if (Znak != "") && (InvFirst == "")
        {
        Result.stringValue += "("
        Result.stringValue += (sender as! NSButton).title
        InvFirst = "-"
        }else{
        Result.stringValue += (sender as! NSButton).title
        Znak = "-"
        First = NSString(string: Result.stringValue).doubleValue
        InvFirst = ""
        dotSwich = false
        }
  
    }
    
    @IBAction func Plus(_ sender: Any) {
        if Result.stringValue == ""{}
        else{
        if swichZnak == false{
        swichZnak = true
        Result.stringValue += (sender as! NSButton).title
        Znak = "+"
        First = NSString(string: Result.stringValue).doubleValue
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
        if Result.stringValue == "" {
        Result.stringValue += "("
        }
        else if Result.stringValue != ""{
        Result.stringValue += ")"
        }
        
    }
    
    @IBAction func Root(_ sender: Any) {
        rootInv = NSString(string: Result.stringValue).doubleValue
        let rootToAr = "\(sqrt(rootInv))"
        let rootArray = rootToAr.components(separatedBy: ".")
        if rootArray[1] == "0"
        {
            Result.stringValue = "\(rootArray[0])"
        }else{
            Result.stringValue = "\(sqrt(rootInv))"
        }
    }
    
    @IBAction func squared(_ sender: Any) {
        rootInv = NSString(string: Result.stringValue).doubleValue
        let squToAr = "\(pow(rootInv, 2))"
        let squArray = squToAr.components(separatedBy: ".")
        if squArray[1] == "0"
        {
            Result.stringValue = "\(squArray[0])"
        }else{
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
        else{
        rootInv = NSString(string: Result.stringValue).doubleValue
        Result.stringValue = "\(rootInv / 100)"
        }
        
    }
    
    
    
    
    
    
    
    
    //end
    
    //func
    
    @IBAction func plusMinus(_ sender: Any) {
        var refrashSimbol = 0
    
        if Znak == ""
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
        }
        }else {
            refrashSimbol = Int(NSString(string: InvFirst).intValue)
            refrashSimbol = -refrashSimbol
           
        }
    }


    
    
    @IBAction func Clear(_ sender: Any) {
        Result.stringValue = ""
        InvFirst = ""
        First = 0
        Second = 0
        Tree = 0
        Otvet = 0
        dotSwich = false
        swichZnak = false
        Znak = ""
        rootInv = 0
        swichMulti = false
    }
    
    
    @IBAction func BackSpase(_ sender: Any) {
        if Result.stringValue != ""
        {
            let clearVar = Result.stringValue
            Result.stringValue.remove(at: clearVar.index(before: clearVar.endIndex))
            let clearInvFirst = InvFirst
            if clearInvFirst == ""{}
            else{
            InvFirst.remove(at: clearInvFirst.index(before: clearInvFirst.endIndex))
            }
        }
    }
    
    //Finish
    
    
    @IBAction func Finish(_ sender: Any) {
        if swichMulti == true{
            buttonN = NSString(string: InvFirst).doubleValue
            let nToAr = "\(pow(rootInv,buttonN))"
            let nArray = nToAr.components(separatedBy: ".")
            Result.stringValue = "\(nArray[0])"
            swichMulti = false
            }else{
        if Result.stringValue == "" || Result.stringValue == "nil" {Result.stringValue = "nil"}else{
        swichZnak = false
        Second = NSString(string: InvFirst).doubleValue
        
        if Otvet == 0 {
        if Second != 0
        {
        if Znak == "/" {
            Otvet = (First) / (Second)
        }
        
        if Znak == "*" {
            Otvet = (First) * (Second)
        }
        
        if Znak == "+" {
            Otvet = First + Second
        }
        
        if Znak == "-" {
            Otvet = First - Second
        }
        let simpleOtvet = "\(Otvet)"
        let simplOtverArray = simpleOtvet.components(separatedBy: ".")
            if simplOtverArray[1] == "0"
            {
            Result.stringValue = "\(simplOtverArray[0])"
            Tree = Otvet
            InvFirst = ""
                Znak = ""
            }else{
                Result.stringValue = "\(Otvet)"
                Znak = ""
            }

        }
        else
        {
            Result.stringValue = "∞"
            Znak = ""
        }
        }
        else
        {
            if Second != 0
            {
                if Znak == "/" {
                    Otvet = (Tree) / (Second)
                }
                
                if Znak == "*" {
                    Otvet = (Tree) * (Second)
                }
                
                if Znak == "+" {
                    Otvet = Tree + Second
                }
                
                if Znak == "-" {
                    Otvet = Tree - Second
                }
                let simpleOtvet = "\(Otvet)"
                let simplOtverArray = simpleOtvet.components(separatedBy: ".")
                if simplOtverArray[1] == "0"
                {
                    Result.stringValue = "\(simplOtverArray[0])"
                    Tree = Otvet
                    Znak = ""
                }else{
                    Result.stringValue = "\(Otvet)"
                    Znak = ""
                }
            }
            else
            {
                Result.stringValue = "∞"
                Znak = ""
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

