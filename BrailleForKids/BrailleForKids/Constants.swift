//
//  Constants.swift
//  BrailleForKids
//
//  Created by Kenny Li on 1/18/20.
//  Copyright © 2020 Alessandro Liu. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

struct Braille {
    var letter: String
    var code: String
    var cellFlags: [Bool]
    
    init() {
        letter = "A"
        code = "100000"
        cellFlags = [false,
                     false,
                     false,
                     false,
                     false,
                     false]
    }
    
    func isAllPressed() -> Bool {
        for flag in cellFlags {
            if (flag == false) {
                return false
            }
        }
        return true
    }
}

/**
 Mapping from letter to the Braille cell code:
  '1' : highlighed
  '0' : hiddened
 */
let AlphabetCode: [String: String] = [
    "a": "100000",
    "b": "110000",
    "c": "100100",
    "d": "100110",
    "e": "100010",
    "f": "110100",
    "g": "110110",
    "h": "110010",
    "i": "010100",
    "j": "010110",
    "k": "101000",
    "l": "111000",
    "m": "101100",
    "n": "101110",
    "o": "101010",
    "p": "111100",
    "q": "111110",
    "r": "111010",
    "s": "011100",
    "t": "011110",
    "u": "101001",
    "v": "111001",
    "w": "010111",
    "x": "101101",
    "y": "101111",
    "z": "101011"
]

/**
 Mappign from letter to its audio
 */
let AlphabetAudio: [String: String] = [
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

/**
 Vibration function
 */
extension UIDevice {
    static func vibrate() {
        //print("vibrate(): ")
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}


