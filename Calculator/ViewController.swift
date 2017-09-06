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
var InvFirst = ""
var Otvet:Double = 0
var dotSwich = false
var swichZnak = false

class ViewController: NSViewController {
    
    @IBOutlet weak var Result: NSTextField!
    
    
    //oneTwoTree
    @IBAction func allSimbols(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        InvFirst += (sender as! NSButton).title
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
    
    
    
    //end
    
    //Mod
    @IBOutlet weak var boxSimpe: NSBox!
    
    @IBAction func Simple(_ sender: Any) {
       
        
            
        
    }
    
    @IBAction func Engineering(_ sender: Any) {
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

