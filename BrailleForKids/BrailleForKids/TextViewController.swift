//
//  TextVC.swift
//  BrailleForKids
//
//  Created by Alessandro on 10/26/19.
//  Copyright © 2019 Alessandro Liu. All rights reserved.
//

import UIKit
import AVFoundation

class TextVC: UIViewController {
    
    
    
    var player: AVAudioPlayer? // make sure you declare in such way!

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadAudioA()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func touchPlay(_ sender: Any) {
        player?.play()
    }

    func loadAudioA() {
        if let audioPath = Bundle.main.path(forResource: "alphabetA", ofType: "mp3"){
            let url = NSURL.fileURL(withPath: audioPath)
            do {
                try player = AVAudioPlayer(contentsOf: url as URL)
            } catch {
                print("Player not available")
            }
        }
    }
}
