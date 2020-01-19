//
//  LearnViewController.swift
//  BrailleForKids
//
//  Created by Kenny Li on 1/18/20.
//  Copyright © 2020 Alessandro Liu. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox
import AVFoundation

class LearnViewController: UIViewController {
    
    // Globals
    var touchSpot: CGRect = CGRect()
    var touchedCells: Set<Int> = []
    var curLetter: Letter = Letter()
    var checkSum: Int = 0
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var BrailleCell: UIImageView!
    @IBOutlet weak var cell1: UIImageView!
    @IBOutlet weak var cell2: UIImageView!
    @IBOutlet weak var cell3: UIImageView!
    @IBOutlet weak var cell4: UIImageView!
    @IBOutlet weak var cell5: UIImageView!
    @IBOutlet weak var cell6: UIImageView!
        
    /**
     
     */
    override func viewDidLoad() {
        self.setRandLetter()
        super.viewDidLoad()
    }
    
    /**
     Detect the beginning touch motion.
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self.view)
        print("----------------------------------------------------")
        print("Screen touch began: \(String(describing: location))!")
    }

    /**
     Detect touch collision with each Braille cell
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var frame: CGRect
        let code = curLetter.code
        print("code[0] = \(Array(code)[0])")
        print("code[1] = \(Array(code)[1])")
        print("code[2] = \(Array(code)[2])")
        print("code[3] = \(Array(code)[3])")
        print("code[4] = \(Array(code)[4])")
        print("code[5] = \(Array(code)[5])")
        
        if let point = touches.first?.location(in: self.view) {
            print("in cell1")
            checkSum += Cell1Index
            frame = cell1.frame
            if (frame.contains(point) &&
                Array(code)[0] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell2")
            checkSum += Cell2Index
            frame = cell2.frame
            if (frame.contains(point) &&
                Array(code)[1] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell3")
            checkSum += Cell3Index
            frame = cell3.frame
            if (frame.contains(point) &&
                Array(code)[2] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell4")
            checkSum += Cell4Index
            frame = cell4.frame
            if (frame.contains(point) &&
            Array(code)[3] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell5")
            checkSum += Cell5Index
            frame = cell5.frame
            if (frame.contains(point) &&
            Array(code)[4] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell6")
            checkSum += Cell6Index
            frame = cell6.frame
            if (frame.contains(point) &&
            Array(code)[5] == "1") {
                UIDevice.vibrate()
            }
        }
    }
    
    /**
    Detect touch release.
    */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self.view)
        print("Screen touch ended: \(String(describing: location))!")
        print("----------------------------------------------------")
        self.checkInput()
    }
    
    /**
     
     */
    func setRandLetter() {
        print("setRandChar(): curRandChar = \(curLetter.code)")
        let randInt: Int = Int(arc4random_uniform(UInt32(AlphabetCode.count)))
        self.curLetter.code = Array(AlphabetCode.values)[randInt]
        self.curLetter.char = Array(AlphabetCode.keys)[randInt]
        print("setRandLetter(): ")
        print("code = \(curLetter.code)")
        print("char = \(curLetter.char)")
    }
    
    /**
     
     */
    func playAudio() {
        print("playAudio(): \(curLetter.char)")
        if let audioPath = Bundle.main
            .path(forResource: AlphabetAudio[curLetter.char], ofType: "mp3") {
            let url = NSURL.fileURL(withPath: audioPath)
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
                audioPlayer.play()
            } catch {
                print("playAudio(): Player not available")
            }
        }
    }
    
    /**
     
     */
    func checkInput() {
        print("checkLetter(): checkSum = \(checkSum)")
        if (checkSum == CellIndexSum) {
            playAudio()
            setRandLetter()
            //checkSum = 0
        }
        checkSum = 0
    }
}

extension String {

  var length: Int {
    return count
  }

  subscript (i: Int) -> String {
    return self[i ..< i + 1]
  }

  func substring(fromIndex: Int) -> String {
    return self[min(fromIndex, length) ..< length]
  }

  func substring(toIndex: Int) -> String {
    return self[0 ..< max(0, toIndex)]
  }

  subscript (r: Range<Int>) -> String {
    let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                        upper: min(length, max(0, r.upperBound))))
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(start, offsetBy: range.upperBound - range.lowerBound)
    return String(self[start ..< end])
  }
    
    

}


