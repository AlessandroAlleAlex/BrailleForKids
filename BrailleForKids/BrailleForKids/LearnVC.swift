//
//  LearnVC.swift
//  BrailleForKids
//
//  Created by Alessandro on 10/25/19.
//  Copyright © 2019 Alessandro Liu. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class LearnVC: UIViewController {
    
    @IBOutlet weak var OB1: UIButton!
    @IBOutlet weak var OB2: UIButton!
    @IBOutlet weak var OB3: UIButton!
    @IBOutlet weak var OB4: UIButton!
    @IBOutlet weak var OB5: UIButton!
    @IBOutlet weak var OB6: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    var myset: Set<Int> = []
    var learningChar: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randChar()
        //print(Alphabet.code[learningChar] ?? "error in playing audio", "*************")
    }

    @IBAction func touchCell1() {
        let vibrateVal = VibrateCode.set1
        if vibrateVal.contains(learningChar) {
            UIDevice.vibrate()
        }
        myset.insert(1)
        print("btn1")
        checkAlphabet()
    }
    
    @IBAction func touchCell2() {
        let vibrateVal = VibrateCode.set2
        if vibrateVal.contains(learningChar) {
            UIDevice.vibrate()
        }
        
        myset.insert(2)
        print("btn2")
        
        checkAlphabet()
    }
    @IBAction func touchCell3() {
        let vibrateVal = VibrateCode.set3
        if vibrateVal.contains(learningChar) {
            UIDevice.vibrate()
        }
        myset.insert(3)
        print("btn3")
        checkAlphabet()
    }
    
    @IBAction func touchCell4() {
        let vibrateVal = VibrateCode.set4
        if vibrateVal.contains(learningChar) {
            UIDevice.vibrate()
        }
        myset.insert(4)
        print("btn4")
        checkAlphabet()
    }
    
    @IBAction func touchCell5() {
        let vibrateVal = VibrateCode.set5
        if vibrateVal.contains(learningChar) {
            UIDevice.vibrate()
        }
        myset.insert(5)
        print("btn5")
        checkAlphabet()
    }
    
    @IBAction func touchCell6() {
        let vibrateVal = VibrateCode.set6
        if vibrateVal.contains(learningChar) {
            UIDevice.vibrate()
        }
        myset.insert(6)
        print("btn6")
        checkAlphabet()
    }
    
    func randChar() {
//        let index: Int = Int(arc4random_uniform(UInt32(Alphabet.code.count)))
//        self.learningChar = Array(Alphabet.code.keys)[index]
//
//        let
//        b1 = VibrateCode.set1,
//        b2 = VibrateCode.set2,
//        b3 = VibrateCode.set3,
//        b4 = VibrateCode.set4,
//        b5 = VibrateCode.set5,
//        b6 = VibrateCode.set6
//
//        if b1.contains(learningChar){
//            OB1.setTitle("Tap for " + String(Alphabet.code[learningChar] ?? "1"), for: .normal)
//            OB1.backgroundColor = UIColor.green
//        } else {
//            OB1.backgroundColor = UIColor.white
//            OB1.setTitle("Not correct", for: .normal)
//        }
//        if b2.contains(learningChar){
//            OB2.setTitle("Tap for " + String(Alphabet.code[learningChar] ?? "1"), for: .normal)
//            OB2.backgroundColor = UIColor.green
//        } else {
//            OB2.backgroundColor = UIColor.white
//            OB2.setTitle("Not correct ", for: .normal)
//        }
//        if b3.contains(learningChar){
//            OB3.setTitle("Tap for " + String(Alphabet.code[learningChar] ?? "1"), for: .normal)
//            OB3.backgroundColor = UIColor.green
//        } else {
//            OB3.backgroundColor = UIColor.white
//            OB3.setTitle("Not correct", for: .normal)
//        }
//        if b4.contains(learningChar){
//            OB4.setTitle("Tap for " + String(Alphabet.code[learningChar] ?? "1"), for: .normal)
//            OB4.backgroundColor = UIColor.green
//        } else {
//            OB4.backgroundColor = UIColor.white
//            OB4.setTitle("Not correct", for: .normal)
//        }
//        if b5.contains(learningChar){
//            OB5.setTitle("Tap for " + String(Alphabet.code[learningChar] ?? "1"), for: .normal)
//            OB5.backgroundColor = UIColor.green
//        } else {
//            OB5.backgroundColor = UIColor.white
//            OB5.setTitle("Not correct", for: .normal)
//        }
//        if b6.contains(learningChar){
//            OB6.setTitle("Tap for " + String(Alphabet.code[learningChar] ?? "1"), for: .normal)
//            OB6.backgroundColor = UIColor.green
//        } else {
//            OB6.backgroundColor = UIColor.white
//            OB6.setTitle("Not correct", for: .normal)
//        }

    }
    
    func checkAlphabet() {
//        // true only when all buttons are pressed at least once
//        if myset.count == 6 {
//            // play audio here
//            print(Alphabet.code[learningChar] ?? "error in playing audio")
//            loadAudio()
//            audioPlayer?.play()
//            // initialize another learn character
//            randChar()
//            // reset the buttons counter
//            myset = []
//        }
    }

    func loadAudio() {
        if let audioPath = Bundle.main.path(forResource: AlphabetAudio[learningChar], ofType: "mp3") {
            let url = NSURL.fileURL(withPath: audioPath)
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
            } catch {
                print("Player not available")
            }
        }
    }
}


