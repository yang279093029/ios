//
//  ViewController.swift
//  calculator
//
//  Created by ykq on 2020/9/26.
//  Copyright © 2020 ykq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    var flag:Int = 0;
    var flag2:Int = 0;
    var flag3:Int = 0;//解决连续点击
  
 
   
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        flag2 = 1;
        flag3 = 0;
        if performingMath == true{
            if sender.tag < 17{
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            }
          
            else if sender.tag == 18{
          
                if label.text == ""{
                    //label.text = "-"
                }
                else{
                    if flag2 == 1{
                    numberOnScreen = Double(label.text!)!
                    numberOnScreen = numberOnScreen * -1
                    label.text = String(numberOnScreen)
                    }
                    else{
                        numberOnScreen = Double(label.text!)!
                        numberOnScreen = numberOnScreen * -1
                        flag = Int(numberOnScreen)
                        label.text = String(flag)
                    }
                    
                   
                }
            }
            else if sender.tag == 100 && label.text != ""{
                numberOnScreen = numberOnScreen / 100
                label.text = String(numberOnScreen)
                
            }
        }
        else{
            if sender.tag < 17{
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            }
            else if sender.tag == 17{
                flag2 = 1
                if label.text == ""{
                label.text = label.text! + "0."
                }
                else{
                    label.text = label.text! + "."
                }
                numberOnScreen = Double(label.text!)!
            }
            else if sender.tag == 18{
                if label.text == ""{
                    //label.text = "-"
                }
                else{
                    if flag2 == 1{
                        numberOnScreen = Double(label.text!)!
                        numberOnScreen = numberOnScreen * -1
                        label.text = String(numberOnScreen)
                    }
                    else{
                        numberOnScreen = Double(label.text!)!
                        numberOnScreen = numberOnScreen * -1
                        flag = Int(numberOnScreen)
                        label.text = String(flag)
                    }
                }
               
            }
            else if sender.tag == 100 && label.text != ""{
                numberOnScreen = numberOnScreen / 100
                label.text = String(numberOnScreen)
            }
        }
     
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        flag2 = 0
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            if flag3 != 1{
                previousNumber = Double(label.text!)!
                
            }
            if sender.tag == 12{// /
                  label.text = "/";
            }
            else if sender.tag == 13{// *
                  label.text = "x";
            }
            else if sender.tag == 14{// -
                  label.text = "-";
            }
            else if sender.tag == 15{//+
                label.text = "+";
            }
            flag3 = 1;
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16{
            flag2 = 1;
            performingMath = true;
            if operation == 12{
                  label.text = String(previousNumber / numberOnScreen)
                numberOnScreen = previousNumber / numberOnScreen
            }
            else if operation == 13{
                  label.text = String(previousNumber * numberOnScreen)
                       numberOnScreen = previousNumber * numberOnScreen
                
            }
            else if operation == 14{
                  label.text = String(previousNumber - numberOnScreen)
                       numberOnScreen = previousNumber - numberOnScreen
            }
            else if operation == 15{
                label.text = String(previousNumber + numberOnScreen)
                       numberOnScreen = previousNumber + numberOnScreen
            }
        }
        else if sender.tag == 11{
            label.text =  "";
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            performingMath = false;
        }
         if sender.tag == 50{
            view.backgroundColor = UIColor.white
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.white
        }
        if sender.tag == 51{
            view.backgroundColor = UIColor.black
            label.textColor = UIColor.white
            label.backgroundColor = UIColor.black
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

