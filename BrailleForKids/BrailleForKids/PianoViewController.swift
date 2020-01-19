
//  PianoViewController.swift
//  BrailleForKids
//
//  Created by Adila on 10/25/19.
//  Copyright © 2019 Alessandro Liu. All rights reserved.
//

import UIKit
import AVFoundation
class PianoViewController: UIViewController, AVAudioPlayerDelegate {
    
    /**
     * Globals:
     */
    var audioPlayer : AVAudioPlayer?
    var audioPlayer2 : AVAudioPlayer?
    var audioPlayer3 : AVAudioPlayer?
    var audioPlayer4 : AVAudioPlayer?
    var audioPlayer5 : AVAudioPlayer?
    var audioPlayer6 : AVAudioPlayer?
    var audioPlayer7 : AVAudioPlayer?
    var audioPlayer8 : AVAudioPlayer?
    var audioPlayer9 : AVAudioPlayer?
    var audioPlayer10 : AVAudioPlayer?
    var audioPlayer11: AVAudioPlayer?
    var audioPlayer12 : AVAudioPlayer?
    var audioPlayer13 : AVAudioPlayer?
    var audioPlayer14 : AVAudioPlayer?
    var modeaudio : AVAudioPlayer?
    
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var k: UIButton!
    @IBOutlet weak var l: UIButton!
    @IBOutlet weak var m: UIButton!
    @IBOutlet weak var n: UIButton!
    
    /**
     Preview setup
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedbyUser(_:)))
        tap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tap)
        playModeAudio()
        
        if let soundURL = Bundle.main.path(forResource: "C5", ofType: "mp3"){
            let url = NSURL.fileURL(withPath: soundURL)
            do{
                try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL2 = Bundle.main.path(forResource: "D5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL2)
            do{
                try audioPlayer2 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL3 = Bundle.main.path(forResource: "E5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL3)
            do{
                try audioPlayer3 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL4 = Bundle.main.path(forResource: "F5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL4)
            do{
                try audioPlayer4 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL5 = Bundle.main.path(forResource: "G5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL5)
            do{
                try audioPlayer5 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL6 = Bundle.main.path(forResource: "A5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL6)
            do{
                try audioPlayer6 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL7 = Bundle.main.path(forResource: "B5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL7)
            do{
                try audioPlayer7 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL8 = Bundle.main.path(forResource: "C6", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL8)
            do{
                try audioPlayer8 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL9 = Bundle.main.path(forResource: "C#5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL9)
            do{
                try audioPlayer9 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL10 = Bundle.main.path(forResource: "D#5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL10)
            do{
                try audioPlayer10 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL11 = Bundle.main.path(forResource: "F#5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL11)
            do{
                try audioPlayer11 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL12 = Bundle.main.path(forResource: "G#5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL12)
            do{
                try audioPlayer12 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL13 = Bundle.main.path(forResource: "A#5", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL13)
            do{
                try audioPlayer13 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
        if let soundURL14 = Bundle.main.path(forResource: "C#6", ofType: "mp3"){
            let url2 = NSURL.fileURL(withPath: soundURL14)
            do{
                try audioPlayer14 = AVAudioPlayer(contentsOf: url2 as URL)
            }catch {
                print("there was some error.")
            }
        }
    }
    
    @IBAction func v1(_ sender: Any) {
        audioPlayer?.play()
    }
    @IBAction func v2(_ sender: Any) {
        audioPlayer2?.play()
    }
    @IBAction func v3(_ sender: Any) {
        audioPlayer3?.play()
    }
    @IBAction func v4(_ sender: Any) {
        audioPlayer4?.play()
    }
    @IBAction func v5(_ sender: Any) {
        audioPlayer5?.play()
    }
    @IBAction func v6(_ sender: Any) {
        audioPlayer6?.play()
    }
    @IBAction func v7(_ sender: Any) {
        audioPlayer7?.play()
    }
    
    @IBAction func v8(_ sender: Any) {
        audioPlayer8?.play()
    }
    @IBAction func c1(_ sender: Any) {
        audioPlayer9?.play()
    }
    @IBAction func c2(_ sender: Any) {
        audioPlayer10?.play()
    }
    @IBAction func c3(_ sender: Any) {
        audioPlayer11?.play()
    }
    @IBAction func c4(_ sender: Any) {
        audioPlayer12?.play()
    }
    @IBAction func c5(_ sender: Any) {
        audioPlayer13?.play()
    }
    @IBAction func c6(_ sender: Any) {
        audioPlayer14?.play()
    }
    
    /**
     Play audio when changing mode
     */
    func playModeAudio() {
        //print("playAudio begin!!!")
        if let soundURL = Bundle.main.path(forResource: "pianomode", ofType: "mp3"){
            let url = NSURL.fileURL(withPath: soundURL)
            do{
                try modeaudio = AVAudioPlayer(contentsOf: url as URL)
            }catch {
                print("there was some error.")
            }
        }
        modeaudio?.play()
    }
    
    /**
     Gesture recognizer for navigating to next view.
     */
    @objc func tappedbyUser(_ gesture:UISwipeGestureRecognizer){
        //print("TAPPED")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vs = storyboard.instantiateViewController(identifier: "LearnViewController")
        let next = vs as! LearnViewController
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }
}

