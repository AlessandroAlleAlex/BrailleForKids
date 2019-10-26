
//  PianoViewController.swift
//  BrailleForKids
//
//  Created by Adila on 10/25/19.
//  Copyright © 2019 Alessandro Liu. All rights reserved.
//

import UIKit
import AVFoundation
class PianoViewController: UIViewController, AVAudioPlayerDelegate {

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
    
    
    var audioPlayer : AVAudioPlayer?
    var audioPlayer2 : AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let soundURL = Bundle.main.path(forResource: "c3", ofType: "mp3"){
            let url = NSURL.fileURL(withPath: soundURL)
            do{
                try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
                    }catch {
                                 print("there was some error.")
                    }
        }
        if let soundURL2 = Bundle.main.path(forResource: "d3", ofType: "mp3"){
                  let url2 = NSURL.fileURL(withPath: soundURL2)
                  do{
                      try audioPlayer2 = AVAudioPlayer(contentsOf: url2 as URL)
                          }catch {
                                       print("there was some error.")
                          }
              }
    }
    func vibrate() {
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate) {
            //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
    
    @IBAction func c3A(_ sender: Any) {
        // vibrate()
        audioPlayer?.play()
    }
    
    @IBAction func d3B(_ sender: Any) {
         //vibrate()
        audioPlayer2?.play()
    }
    
    
    @IBAction func e4C(_ sender: Any) {
         //vibrate()
        audioPlayer?.play()
    }
    @IBAction func f3D(_ sender: Any) {
         //vibrate()
        audioPlayer?.play()
    }
    @IBAction func g3E(_ sender: Any) {
         //vibrate()
        audioPlayer?.play()
    }
    @IBAction func a3F(_ sender: Any) {
         //vibrate()
        audioPlayer?.play()
    }
    @IBAction func h3G(_ sender: Any) {
         vibrate()
    }
        
    
    @IBAction func c4H(_ sender: Any) {
        vibrate()
    }
    
    @IBAction func cis3I(_ sender: Any) {
        vibrate()
    }
    
    @IBAction func dis4J(_ sender: Any) {
         vibrate()
    }
    
    @IBAction func fis3k(_ sender: Any) {
         vibrate()
    }
    
    @IBAction func gis3L(_ sender: Any) {
         vibrate()
    }
    
    @IBAction func As3M(_ sender: Any) {
         vibrate()
    }
    
    @IBAction func cis4N(_ sender: Any) {
         vibrate()
    }
}

