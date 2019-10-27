//
//  LearnVC.swift
//  BrailleForKids
//
//  Created by Alessandro on 10/25/19.
//  Copyright © 2019 Alessandro Liu. All rights reserved.
//

import UIKit
import AudioToolbox

class LearnVC: UIViewController {
    
    @IBOutlet weak var OB1: UIButton!
    @IBOutlet weak var OB2: UIButton!
    @IBOutlet weak var OB3: UIButton!
    @IBOutlet weak var OB4: UIButton!
    @IBOutlet weak var OB5: UIButton!
    @IBOutlet weak var OB6: UIButton!
    
    
    
    var myset: Set<Int> = []
    var learnCharCode: String = ""
    let brailleAlphabet: [String: Character] = [
        
    
        "100000": "a",
        "110000": "b",
        "100100": "c",
        "100110": "d",
        "100010": "e",
        "110100": "f",
        "110110": "g",
        "110010": "h",
        "010100": "i",
        "010110": "j",
        "101000": "k",
        "111000": "l",
        "101100": "m",
        "101110": "n",
        "101010": "o",
        "111100": "p",
        "111110": "q",
        "111010": "r",
        "011100": "s",
        "011110": "t",
        "101001": "u",
        "111001": "v",
        "010111": "w",
        "101101": "x",
        "101111": "y",
        "101011": "z"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        randChar()
        print(brailleAlphabet[learnCharCode] ?? "error in playing audio", "*************")
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func newB1() {
        let vibrateVal = ["100000","110000","100100","100110","100010","110100","110110","110010","101000","111000","101100","101110","101010","111100","111110","111010","101001","111001","101101","101111","101011"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(1)
        print("btn1")
        checkAlphabet()
    }
    @IBAction func newB2() {
        let vibrateVal = ["100100","100110","110100","110110","010100","010110","101100","101110","111100","111110","011100","011110","010111","101101","101111"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        
        myset.insert(2)
        print("btn2")
        
        checkAlphabet()
    }
    @IBAction func newB3() {
        let vibrateVal = ["110000","110100","110110","110010","010100","010110","111000","111100","111110","111010","011100","011110","111001","010111"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(3)
        print("btn3")
        checkAlphabet()
    }
    
    @IBAction func newB4() {
        let vibrateVal = ["100110","100010","110110","110010","010110","101110","101010","111110","111010","011110","010111","101111","101011"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(4)
        print("btn4")
        checkAlphabet()
    }
    
    @IBAction func newB5() {
        let vibrateVal = ["101000","111000","101100","101110","101010","111100","111110","111010","011100","011110","101001","111001","010111","101101","101111","101011"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(5)
        print("btn5")
        checkAlphabet()
    }
    
    @IBAction func newB6() {
        let vibrateVal = ["101001", "111001", "010111", "101101", "101111", "101011"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(6)
        print("btn6")
        checkAlphabet()
    }
    
    func randChar() {
        let index: Int = Int(arc4random_uniform(UInt32(brailleAlphabet.count)))
        self.learnCharCode = Array(brailleAlphabet.keys)[index]
        let b1 = ["100000","110000","100100","100110","100010","110100","110110","110010","101000","111000","101100","101110","101010","111100","111110","111010","101001","111001","101101","101111","101011"]
        let b2 = ["100100","100110","110100","110110","010100","010110","101100","101110","111100","111110","011100","011110","010111","101101","101111"]
        let b3 = ["110000","110100","110110","110010","010100","010110","111000","111100","111110","111010","011100","011110","111001","010111"]
        let b4 = ["100110","100010","110110","110010","010110","101110","101010","111110","111010","011110","010111","101111","101011"]
        let b5 = ["101000","111000","101100","101110","101010","111100","111110","111010","011100","011110","101001","111001","010111","101101","101111","101011"]
        let b6 = ["101001", "111001", "010111", "101101", "101111", "101011"]
        
        if b1.contains(learnCharCode){
            OB1.setTitle("Tap for " + String(brailleAlphabet[learnCharCode] ?? "1"), for: .normal)
            OB1.backgroundColor = UIColor.green
        } else {
            OB1.backgroundColor = UIColor.white
            OB1.setTitle("Not correct", for: .normal)
        }
        if b2.contains(learnCharCode){
            OB2.setTitle("Tap for " + String(brailleAlphabet[learnCharCode] ?? "1"), for: .normal)
            OB2.backgroundColor = UIColor.green
        } else {
            OB2.backgroundColor = UIColor.white
            OB2.setTitle("Not correct ", for: .normal)
        }
        if b3.contains(learnCharCode){
            OB3.setTitle("Tap for " + String(brailleAlphabet[learnCharCode] ?? "1"), for: .normal)
            OB3.backgroundColor = UIColor.green
        } else {
            OB3.backgroundColor = UIColor.white
            OB3.setTitle("Not correct", for: .normal)
        }
        if b4.contains(learnCharCode){
            OB4.setTitle("Tap for " + String(brailleAlphabet[learnCharCode] ?? "1"), for: .normal)
            OB4.backgroundColor = UIColor.green
        } else {
            OB4.backgroundColor = UIColor.white
            OB4.setTitle("Not correct", for: .normal)
        }
        if b5.contains(learnCharCode){
            OB5.setTitle("Tap for " + String(brailleAlphabet[learnCharCode] ?? "1"), for: .normal)
            OB5.backgroundColor = UIColor.green
        } else {
            OB5.backgroundColor = UIColor.white
            OB5.setTitle("Not correct", for: .normal)
        }
        if b6.contains(learnCharCode){
            OB6.setTitle("Tap for " + String(brailleAlphabet[learnCharCode] ?? "1"), for: .normal)
            OB6.backgroundColor = UIColor.green
        } else {
            OB6.backgroundColor = UIColor.white
            OB6.setTitle("Not correct", for: .normal)
        }

    }
    
    func checkAlphabet() {
        // true only when all buttons are pressed at least once
        if myset.count == 6 {
            // play audio here
            print(brailleAlphabet[learnCharCode] ?? "error in playing audio")
            // initialize another learn character
            randChar()
            // reset the buttons counter
            myset = []
        }
    }

}
