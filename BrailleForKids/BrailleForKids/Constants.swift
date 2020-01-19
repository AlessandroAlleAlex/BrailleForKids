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

struct VibrateCode {
    
    static let set1 =  ["100000","110000","100100","100110","100010","110100","110110","110010","101000","111000","101100","101110","101010","111100","111110","111010","101001","111001","101101","101111","101011"]
    static let set2 =  ["100100","100110","110100","110110","010100","010110","101100","101110","111100","111110","011100","011110","010111","101101","101111"]
    static let set3 =  ["110000","110100","110110","110010","010100","010110","111000","111100","111110","111010","011100","011110","111001","010111"]
    static let set4 = ["100110","100010","110110","110010","010110","101110","101010","111110","111010","011110","010111","101111","101011"]
    static let set5 =    ["101000","111000","101100","101110","101010","111100","111110","111010","011100","011110","101001","111001","010111","101101","101111","101011"]
    static let set6 =
        ["101001", "111001", "010111", "101101", "101111", "101011"]
}

//struct Alphabet {
//
//    static let code: [String: String] = [
//        "100000": "a",
//        "110000": "b",
//        "100100": "c",
//        "100110": "d",
//        "100010": "e",
//        "110100": "f",
//        "110110": "g",
//        "110010": "h",
//        "010100": "i",
//        "010110": "j",
//        "101000": "k",
//        "111000": "l",
//        "101100": "m",
//        "101110": "n",
//        "101010": "o",
//        "111100": "p",
//        "111110": "q",
//        "111010": "r",
//        "011100": "s",
//        "011110": "t",
//        "101001": "u",
//        "111001": "v",
//        "010111": "w",
//        "101101": "x",
//        "101111": "y",
//        "101011": "z"
//    ]
//}

let AlphabetCode: [String: String] = [
    "a": "100000",
    "b": "110000"
]

struct Letter {
    var char: String
    var code: String
    
    init() {
        char = "A"
        code = "100000"
    }
}


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

let Cell1Index = 1;
let Cell2Index = 2;
let Cell3Index = 3;
let Cell4Index = 4;
let Cell5Index = 5;
let Cell6Index = 6;
let CellIndexSum = 1 + 2 + 3 + 4 + 5 + 6;

extension UIDevice {
    static func vibrate() {
        print("vibrate(): ")
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}


