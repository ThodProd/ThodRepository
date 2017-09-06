//
//  ViewController.swift
//  Calculator
//
//  Created by Валерий Спиркин on 03.09.17.
//  Copyright © 2017 ThodProd. All rights reserved.
//

import Cocoa
var Znak = "+"
var First:Double = 0
var Second:Double = 0
var Tree:Double = 0
var InvFirst = ""
var Otvet:Double = 0

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
        Result.stringValue += (sender as! NSButton).title
        Znak = "/"
        First = NSString(string: InvFirst).doubleValue
        InvFirst = ""
    }
    
    @IBAction func Multi(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        Znak = "*"
        First = NSString(string: InvFirst).doubleValue
        InvFirst = ""
    }
    
    @IBAction func Minus(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        Znak = "-"
        First = NSString(string: InvFirst).doubleValue
        InvFirst = ""
    }
    
    @IBAction func Plus(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        Znak = "+"
        First = NSString(string: InvFirst).doubleValue
        InvFirst = ""
    }
    
    @IBAction func Dot(_ sender: Any) {
        if Result.stringValue == ""
        {
        Result.stringValue = "0" + (sender as! NSButton).title
        }
        else
        {
        Result.stringValue += (sender as! NSButton).title
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
        Result.stringValue += "-"
    }
    
    
    @IBAction func Clear(_ sender: Any) {
        Result.stringValue = ""
        InvFirst = "0"
        First = 0
        Second = 0
        Tree = 0
        Otvet = 0
        
    }
    
    
    @IBAction func BackSpase(_ sender: Any) {
        if Result.stringValue != ""
        {
            let ClearVar = Result.stringValue
            Result.stringValue.remove(at: ClearVar.index(before: ClearVar.endIndex))
        }
    }
    
    //Finish
    
    
    @IBAction func Finish(_ sender: Any) {
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
        Result.stringValue = "\(Otvet)"
            Tree = Otvet
            InvFirst = ""

        }
        else
        {
            Result.stringValue = "∞"
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
                Result.stringValue = "\(Otvet)"
                Tree = Otvet
                InvFirst = ""
                
            }
            else
            {
                Result.stringValue = "∞"
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

