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
import Speech

class LearnViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    /**
     * Globals:
     *
     * audioEngine: updates when the mic is receiving audio
     * speechRecognizer: speech recognition, can fail to recognize speech
     * speechRecognizer: and return nil, so it’s best to make it an optional.
     * request: allocates speech as the user speaks in real-time and controls the buffering
     * recognitionTask: is used to manage, cancel, or stop the current recognition task
     */
    var touchSpot: CGRect = CGRect()
    var touchedCells: Set<Int> = []
    var curBraille: Braille = Braille()
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    var audioPlayer2: AVAudioPlayer?
    var speechFlag: Bool = false
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-GB"))!
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    @IBOutlet weak var cell1: UIImageView!
    @IBOutlet weak var cell2: UIImageView!
    @IBOutlet weak var cell3: UIImageView!
    @IBOutlet weak var cell4: UIImageView!
    @IBOutlet weak var cell5: UIImageView!
    @IBOutlet weak var cell6: UIImageView!
    @IBOutlet weak var curLetter: UILabel!
    
    /**
     Preview setup.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setRandLetter()
        self.playAudio()
        self.displayLetter()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedbyUser(_:)))
        tap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tap)
        playModeAudio()
    }
    
    /**
     Detect the beginning touch motion.
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    /**
     Detect touch collision with each Braille cell
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let code = curBraille.code
        
        if let point = touches.first?.location(in: self.view) {
            if (cell1.frame).contains(point) {
                curBraille.cellFlags[0] = true
                if (Array(code)[0] == "1") {
                    //print("in cell1")
                    UIDevice.vibrate()
                }
            }
            else if (cell2.frame).contains(point) {
                curBraille.cellFlags[1] = true
                if (Array(code)[1] == "1") {
                    //print("in cell2")
                    UIDevice.vibrate()
                }
            }
            else if (cell3.frame).contains(point) {
                curBraille.cellFlags[2] = true
                if (Array(code)[2] == "1") {
                    //print("in cell3")
                    UIDevice.vibrate()
                }
            }
            else if (cell4.frame).contains(point) {
                curBraille.cellFlags[3] = true
                if (Array(code)[3] == "1") {
                    //print("in cell4")
                    UIDevice.vibrate()
                }
            }
            else if (cell5.frame).contains(point) {
                curBraille.cellFlags[4] = true
                if (Array(code)[4] == "1") {
                    //print("in cell5")
                    UIDevice.vibrate()
                }
            }
            else if (cell6.frame).contains(point) {
                curBraille.cellFlags[5] = true
                if (Array(code)[5] == "1") {
                    //print("in cell6")
                    UIDevice.vibrate()
                }
            }
        }
    }
    
    /**
     Detect touch release.
     */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.playAudio()
        self.audioPlayer.play()
        self.setRandLetter()
        //self.playAudio()
        self.displayLetter()
    }
    
    /**
     Random generatr a letter
     */
    func setRandLetter() {
        let randInt: Int = Int(arc4random_uniform(UInt32(AlphabetCode.count)))
        self.curBraille.code = Array(AlphabetCode.values)[randInt]
        self.curBraille.letter = Array(AlphabetCode.keys)[randInt]
        //print("setRandLetter(): \(curBraille.code), \(curBraille.letter)")
    }
    
    /**
     Play audio for letter
     */
    func playAudio() {
        if let audioPath = Bundle.main
            .path(forResource: AlphabetAudio[curBraille.letter], ofType: "mp3") {
            print("loading audio: \(String(describing: AlphabetAudio[curBraille.letter]))")
            let url = NSURL.fileURL(withPath: audioPath)
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
            } catch {
                print("playAudio(): Player not available")
            }
        }
    }
    
    /**
     Play audio for mode change
     */
    func playModeAudio() {
        if let audioPath = Bundle.main.path(forResource: "learnmode", ofType: "mp3"){
            let url = NSURL.fileURL(withPath: audioPath)
            do {
                try audioPlayer2 = AVAudioPlayer(contentsOf: url as URL)
            } catch {
                print("playAudio(): Player not available")
            }
        }
        audioPlayer2?.play()
    }
    
    /**
     Gesture recognizer for navigatin
     */
    @objc func tappedbyUser(_ gesture:UISwipeGestureRecognizer) {
        //print("TAPPED")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vs = storyboard.instantiateViewController(identifier: "QuizViewController")
        let next = vs as! quizModeViewController
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }
    
    /**
     Highlight the letter coressponding cell.
     */
    func displayLetter() {
        let bits = Array(curBraille.code)
        var index: Int = 0
        
        self.curLetter.text = curBraille.letter
        
        cell1.alpha = 1
        cell2.alpha = 1
        cell3.alpha = 1
        cell4.alpha = 1
        cell5.alpha = 1
        cell6.alpha = 1
        for bit in bits {
            if (bit == "0") {
                switch index {
                case 0:
                    cell1.alpha = 0.5
                    break;
                case 1:
                    cell2.alpha = 0.5
                    break;
                case 2:
                    cell3.alpha = 0.5
                    break;
                case 3:
                    cell4.alpha = 0.5
                    break;
                case 4:
                    cell5.alpha = 0.5
                    break;
                case 5:
                    cell6.alpha = 0.5
                    break;
                default:
                    break;
                }
            }
            index += 1
        }
    }
}


