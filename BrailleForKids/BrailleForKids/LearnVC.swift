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
    
    var audioPlayer: AVAudioPlayer?
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
    
    var audioList: [Character: String] = [
        "a": "alphabetA",
        "b": "alphabetB",
        "c": "alphabetC",
        "d": "alphabetD",
        "e": "alphabetE",
        "f": "alphabetF",
        "g": "alphabetG",
        "h": "alphabetH",
        "i": "alphabetI",
        "j": "alphabetJ",
        "k": "alphabetK",
        "l": "alphabetL",
        "m": "alphabetM",
        "n": "alphabetN",
        "o": "alphabetO",
        "p": "alphabetP",
        "q": "alphabetQ",
        "r": "alphabetR",
        "s": "alphabetS",
        "t": "alphabetT",
        "u": "alphabetU",
        "v": "alphabetV",
        "w": "alphabetW",
        "x": "alphabetX",
        "y": "alphabetY",
        "z": "alphabetZ"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randChar()
        print(brailleAlphabet[learnCharCode] ?? "error in playing audio", "*************")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1() {
        let vibrateVal = ["100000","110000","100100","100110","100010","110100","110110","110010","101000","111000","101100","101110","101010","111100","111110","111010","101001","111001","101101","101111","101011"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(1)
        print("btn1")
        checkAlphabet()
    }
    @IBAction func btn2() {
        let vibrateVal = ["100100","100110","110100","110110","010100","010110","101100","101110","111100","111110","011100","011110","010111","101101","101111"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        
        myset.insert(2)
        print("btn2")
        
        checkAlphabet()
    }
    @IBAction func btn3() {
        let vibrateVal = ["110000","110100","110110","110010","010100","010110","111000","111100","111110","111010","011100","011110","111001","010111"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(3)
        print("btn3")
        checkAlphabet()
    }
    @IBAction func btn4() {
        let vibrateVal = ["100110","100010","110110","110010","010110","101110","101010","111110","111010","011110","010111","101111","101011"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(4)
        print("btn4")
        checkAlphabet()
    }
    @IBAction func btn5() {
        let vibrateVal = ["101000", "111000", "101100"
        ,"101110", "101010", "111100", "111110", "111010", "011100", "011110", "101001", "111001", "101101", "101111", "101011"]
        if vibrateVal.contains(learnCharCode) {
            // vibrate device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        myset.insert(5)
        print("btn5")
        checkAlphabet()
    }
    @IBAction func btn6() {
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
    }
    
    
    func checkAlphabet() {
        // true only when all buttons are pressed at least once
        if myset.count == 6 {
            // play audio here
            print(brailleAlphabet[learnCharCode] ?? "error in playing audio")
            loadAudio(learningChar: brailleAlphabet[learnCharCode]!)
            audioPlayer?.play()
            // initialize another learn character
            randChar()
            // reset the buttons counter
            myset = []
        }
        
        
    }

    func loadAudio(learningChar: Character) {
        if let audioPath = Bundle.main.path(forResource: audioList[learningChar], ofType: "mp3") {
            let url = NSURL.fileURL(withPath: audioPath)
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
            } catch {
                print("Player not available")
            }
        }
    }
    
    // you just call two thinhs:
    // loadAudio("c") ("c" is the learning charater)
    // audioplayer?.play()
}
