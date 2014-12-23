//
//  ViewController.swift
//  guessNumber
//
//  Created by Harry on 2014/12/10.
//  Copyright (c) 2014年 huangharry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tempStr = ""
    var count = 0
    var countA = 0
    var countB = 0
    var result = [0,0,0,0]
    var ansVar = [Int]()
    var randomNum = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,]
    var guessNumber = [Int]()
    var tempArr = [Int]()

    @IBOutlet weak var numA: UILabel!
    @IBOutlet weak var numB: UILabel!
    @IBOutlet weak var resultNumber: UILabel!
    @IBOutlet weak var answerNumber: UILabel!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    @IBAction func restart(sender: AnyObject) {
        //randomNum.removeAll(keepCapacity: false)
        self.setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
        //self.random()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func zeroTouch(sender: AnyObject) {
        zero.enabled = false
        detect("0")
    }
    @IBAction func oneTouch(sender: AnyObject) {
        one.enabled = false
        detect("1")
    }
    @IBAction func twoTouch(sender: AnyObject) {
        two.enabled = false
        detect("2")
    }
    @IBAction func threeTouch(sender: AnyObject) {
        three.enabled = false
        detect("3")
    }
    @IBAction func fourTouch(sender: AnyObject) {
        four.enabled = false
        detect("4")
    }
    @IBAction func fiveTouch(sender: AnyObject) {
        five.enabled = false
        detect("5")
    }
    @IBAction func sixTouch(sender: AnyObject) {
        six.enabled = false
        detect("6")
    }
    @IBAction func sevenTouch(sender: AnyObject) {
        seven.enabled = false
        detect("7")
    }
    @IBAction func eightTouch(sender: AnyObject) {
        eight.enabled = false
        detect("8")
    }
    @IBAction func nineTouch(sender: AnyObject) {
        nine.enabled = false
        detect("9")
    }
    
    
    func detect(touchWhat: String) {
        
        if count < 4 {
            count++
            tempStr += touchWhat
            resultNumber.text = tempStr
            //println(tempStr)
        }//this is if count < 4 block end
        
        if count == 4 {
            resultNumber.text = "您輸入的值為：" + tempStr
            var numberFormString = tempStr.toInt()
            
            for c in tempStr {
                tempArr.append(String(c).toInt()!)
            }
            
            for i in 0..<4 {
                for j in 0..<4 {
                    if(tempArr[i] == result[i]){
                        countA++;
                        println("this is a : \(countA),a++")
                        break;
                    }
                    else if(tempArr[i] == result[j]) {
                        countB++
                        println("this is b : \(countB),b++")
                    }
                }
            }
            println("a = \(countA) , b = \(countB)")
            println(tempArr)
            numA.text = "\(countA)"
            numB.text = "\(countB)"
            self.reset()
            println(tempArr)
            /*for c in tempStr {
                println(c)
            }*/
        }//this is count == 4 block end
        println("this is count: \(count)")
    }//this is func detect block end
    
    func setUp() {
        resultNumber.text = "請輸入4個數字"
        self.random()
    }
    
    func random() {
        for i in 0...9 {
            let random = Int(arc4random_uniform(UInt32(10)))
            var temp = randomNum[random]
            randomNum[random] = randomNum[i]
            randomNum[i] = temp
        }
        for i in 0..<4 {
            result[i] = randomNum[i]
        }
        //answerNumber.text = "\(result)"
    }
    
    func reset() {
        zero.enabled = true
        one.enabled = true
        two.enabled = true
        three.enabled = true
        four.enabled = true
        five.enabled = true
        six.enabled = true
        seven.enabled = true
        eight.enabled = true
        nine.enabled = true
        count = 0
        tempStr = ""
        countA = 0
        countB = 0
        tempArr.removeAll(keepCapacity: false)
    }
    
}

