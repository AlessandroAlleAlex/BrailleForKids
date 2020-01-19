//
//  quizModeViewController.swift
//  BrailleForKids
//
//  Created by Adila on 1/19/20.
//  Copyright © 2020 Alessandro Liu. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox
import AVFoundation
import Speech

class quizModeViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    // Globals
    var touchSpot: CGRect = CGRect()
    var touchedCells: Set<Int> = []
    var curBraille: Braille = Braille()
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    var audioPlayer2: AVAudioPlayer?
    var isCorrect: Bool = false
    
    // It will give updates when the mic is receiving audio
    let audioEngine = AVAudioEngine()
    // This will do the actual speech recognition. It can fail to recognize speech
    // and return nil, so it’s best to make it an optional.
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-GB"))!
    // This allocates speech as the user speaks in real-time and controls the buffering
    let request = SFSpeechAudioBufferRecognitionRequest()
    // This will be used to manage, cancel, or stop the current recognition task
    var recognitionTask: SFSpeechRecognitionTask?
    
    @IBOutlet weak var cell1: UIImageView!
    @IBOutlet weak var cell2: UIImageView!
    @IBOutlet weak var cell3: UIImageView!
    @IBOutlet weak var cell4: UIImageView!
    @IBOutlet weak var cell5: UIImageView!
    @IBOutlet weak var cell6: UIImageView!
    
    /**
     Set up
     */
    override func viewDidLoad() {
        super.viewDidLoad()
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
                //print("in cell1")
                curBraille.cellFlags[0] = true
                if (Array(code)[0] == "1") {
                    print("in cell1")
                    UIDevice.vibrate()
                }
            }
            else if (cell2.frame).contains(point) {
                //print("in cell2")
                curBraille.cellFlags[1] = true
                if (Array(code)[1] == "1") {
                    print("in cell2")
                    UIDevice.vibrate()
                }
            }
            else if (cell3.frame).contains(point) {
                //print("in cell3")
                curBraille.cellFlags[2] = true
                if (Array(code)[2] == "1") {
                    print("in cell3")
                    UIDevice.vibrate()
                }
            }
            else if (cell4.frame).contains(point) {
                //print("in cell4")
                curBraille.cellFlags[3] = true
                if (Array(code)[4] == "1") {
                    print("in cell4")
                    UIDevice.vibrate()
                }
            }
            else if (cell5.frame).contains(point) {
                //print("in cell5")
                curBraille.cellFlags[4] = true
                if (Array(code)[4] == "1") {
                    print("in cell5")
                    UIDevice.vibrate()
                }
            }
            else if (cell6.frame).contains(point) {
                //print("in cell6")
                curBraille.cellFlags[5] = true
                if (Array(code)[5] == "1") {
                    print("in cell6")
                    UIDevice.vibrate()
                }
            }
        }
    }
    
    /**
     Detect touch release.
     */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.checkInput()
    }
    
    /**
      Generate a random letter.
      */
     func setRandLetter() {
         let randInt: Int = Int(arc4random_uniform(UInt32(AlphabetCode.count)))
         self.curBraille.code = Array(AlphabetCode.values)[randInt]
         self.curBraille.letter = Array(AlphabetCode.keys)[randInt]
         print("setRandLetter(): \(curBraille.code), \(curBraille.letter)")
     }
    
    /**
     Check user's speech.
     */
    func checkInput() {
        print("Checking letter '\(curBraille.letter)'")
        for flag in curBraille.cellFlags {
            print("\(flag)")
        }
        if (curBraille.isAllPressed()) {
            print("Speech is testing.")
            self.speechTest()
        } else {
            print("Faill speech testing.")
            self.curBraille = Braille()
            self.setRandLetter()
        }
    }
    
    /**
     The method that will perform the speech recognition:
     */
    func recordAndRecognizeSpeech() {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.request.append(buffer)
        }
        // prepare and start the recording using the audio engine:
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            return print(error)
        }
        // checks to make sure the recognizer is available for the device and for the locale,
        // since it will take into account location to get language.
        guard let myRecognizer = SFSpeechRecognizer() else {
            print("ERROR: THE LANGUAGE IS NOT RECOGNIZED AT THE CURRENT LOCALE OR LOCATION ...")
            return
        }
        if !myRecognizer.isAvailable {
            print("ERROR: THE RECOGNIZER IS NOT AVAILABLE ...")
            return
        }
        recognitionTask = speechRecognizer.recognitionTask(with: request, resultHandler: { result, error in
            if let res = result {
                let returnedString = res.bestTranscription.formattedString
                print("------------------",self.curBraille.letter)
                if (self.curBraille.letter == String((returnedString.first ?? "-")).lowercased()) {
                    self.isCorrect = true
                }
                print("ReturnStr = \(returnedString.first ?? "-")") // get the LAST character form the input speech
                print("returnedString --> \(returnedString)...")
            } else if let err = error {
                print(err)
            }
        })
    }
    
    func speechTest() {
        recordAndRecognizeSpeech()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.audioEngine.stop()
            self.request.endAudio()
            self.recognitionTask?.cancel()
            self.recognitionTask = nil
            self.audioEngine.inputNode.removeTap(onBus: 0)
            

            print("isCorrect = \(self.isCorrect)")
            if (self.isCorrect) {
                self.isCorrect = false
                self.playAudio()
                self.audioPlayer.play()
            } else {
                //self.playAudio() //play wrong
                //self.audioPlayer.play()
            }
            
            // audio and reset
            self.curBraille = Braille()
            self.setRandLetter()
        }
    }
    
    /**
     Play audio for correct or wrong answer
     */
    func playAudio() {
        if let audioPath = Bundle.main.path(forResource: "Correct", ofType: "mp3"){
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
        if let audioPath = Bundle.main.path(forResource: "quizmode", ofType: "mp3"){
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
        //print("TAPžED")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vs = storyboard.instantiateViewController(identifier: "PianoViewController")
        let next = vs as! PianoViewController
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }
}
