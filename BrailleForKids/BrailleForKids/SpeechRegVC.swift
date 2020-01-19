//
//  SpeechRegVC.swift
//  BrailleForKids
//
//  Created by AL on 1/18/20.
//  Copyright © 2020 Alessandro Liu. All rights reserved.
//

import UIKit
import Speech

class SpeechRegVC: UIViewController, SFSpeechRecognizerDelegate {
    @IBOutlet weak var transcribeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func startStopBtn() {
        transcribeLabel.text = "yes..."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
