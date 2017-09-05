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
var InvFirst = ""
var Otvet:Double = 0

class ViewController: NSViewController {
    
    @IBOutlet weak var Result: NSTextField!
    
    
    //oneTwoTree
    @IBAction func Zerro(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "0"
    }
   
    @IBAction func One(_ sender: Any) {
         Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "1"
    }
    
    @IBAction func Two(_ sender: Any) {
         Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "2"
    }
    
    @IBAction func Tree(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "3"
    }
    
    @IBAction func Four(_ sender: Any) {
         Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "4"
    }
    
    @IBAction func Five(_ sender: Any) {
         Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "5"
    }
    
    @IBAction func Six(_ sender: Any) {
         Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "6"
    }
    
    @IBAction func Seven(_ sender: Any) {
         Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "7"
    }
    
    @IBAction func Eight(_ sender: Any) {
         Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "8"
    }
    
    @IBAction func Nine(_ sender: Any) {
         Result.stringValue += (sender as! NSButton).title
        InvFirst = InvFirst + "9"
    }
    
    //end
    
    
    //Symbol
    
    @IBAction func Division(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        Znak = "/"
        First = Double(Int(NSString(string: Result.stringValue).intValue))
        InvFirst = "0"
    }
    
    @IBAction func Multi(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        Znak = "*"
        First = Double(Int(NSString(string: Result.stringValue).intValue))
        InvFirst = "0"
    }
    
    @IBAction func Minus(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        Znak = "-"
        First = Double(Int(NSString(string: Result.stringValue).intValue))
        InvFirst = "0"
    }
    
    @IBAction func Plus(_ sender: Any) {
        Result.stringValue += (sender as! NSButton).title
        Znak = "+"
        First = Double(Int(NSString(string: Result.stringValue).intValue))
        InvFirst = "0"
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
        Second = Double(Int(NSString(string: InvFirst).intValue))
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

