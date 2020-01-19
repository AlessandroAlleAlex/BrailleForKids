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
    var curBraille: Braille = Braille()
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    var audioPlayer2: AVAudioPlayer?
    
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedbyUser(_:)))
         tap.numberOfTapsRequired = 3
         self.view.addGestureRecognizer(tap)
        playModeAudio()
    }
    @objc func tappedbyUser(_ gesture:UISwipeGestureRecognizer){
        print("TAPPED")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vs = storyboard.instantiateViewController(identifier: "PianoViewController")
        let next = vs as! PianoViewController
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }
    func playModeAudio() {
        print("playAudio begin!!!")
       if let soundURL = Bundle.main.path(forResource: "learnmode", ofType: "mp3"){
           let url = NSURL.fileURL(withPath: soundURL)
           do{
               try audioPlayer2 = AVAudioPlayer(contentsOf: url as URL)
                   }catch {
                                print("there was some error.")
        }
       }
        audioPlayer2?.play()
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
        let code = curBraille.code
        print("code[0] = \(Array(code)[0])")
        print("code[1] = \(Array(code)[1])")
        print("code[2] = \(Array(code)[2])")
        print("code[3] = \(Array(code)[3])")
        print("code[4] = \(Array(code)[4])")
        print("code[5] = \(Array(code)[5])")
        
        if let point = touches.first?.location(in: self.view) {
            print("in cell1")
            curBraille.cellFlags[0] = true
            frame = cell1.frame
            if (frame.contains(point) &&
                Array(code)[0] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell2")
            curBraille.cellFlags[1] = true
            frame = cell2.frame
            if (frame.contains(point) &&
                Array(code)[1] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell3")
            curBraille.cellFlags[2] = true
            frame = cell3.frame
            if (frame.contains(point) &&
                Array(code)[2] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell4")
            curBraille.cellFlags[3] = true
            frame = cell4.frame
            if (frame.contains(point) &&
            Array(code)[3] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell5")
            curBraille.cellFlags[4] = true
            frame = cell5.frame
            if (frame.contains(point) &&
            Array(code)[4] == "1") {
                UIDevice.vibrate()
            }
        }
        else if let point = touches.first?.location(in: self.view) {
            print("in cell6")
            curBraille.cellFlags[5] = true
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
        print("setRandChar(): curRandChar = \(curBraille.code)")
        let randInt: Int = Int(arc4random_uniform(UInt32(AlphabetCode.count)))
        self.curBraille.code = Array(AlphabetCode.values)[randInt]
        self.curBraille.letter = Array(AlphabetCode.keys)[randInt]
        print("setRandLetter(): ")
        print("code = \(curBraille.code)")
        print("char = \(curBraille.letter)")
    }
    
    /**
     
     */
    func playAudio() {
        print("playAudio(): \(curBraille.letter)")
        if let audioPath = Bundle.main
            .path(forResource: AlphabetAudio[curBraille.letter], ofType: "mp3") {
            let url = NSURL.fileURL(withPath: audioPath)
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
                audioPlayer.play()
            } catch {
                print("playAudio(): Player not available")
            }
        }
    }
    
    func checkInput() {
        if (curBraille.isAllPressed()) {
            playAudio()
            setRandLetter()
        }
        self.curBraille = Braille()
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


