//
//  SMSViewController.swift
//  BrailleForKids
//
//  Created by Adila on 1/18/20.
//  Copyright © 2020 Alessandro Liu. All rights reserved.
//

import UIKit
import MessageUI

class SMSViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    @IBOutlet weak var phonetxtfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        if (MFMessageComposeViewController.canSendText()) {
            let messageVC = MFMessageComposeViewController()
//            composeVC.messageComposeDelegate = self
            messageVC.body = "Hello from Adila :D";
            messageVC.recipients = ["9255486716"]
            messageVC.messageComposeDelegate = self
            self.present(messageVC, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
}
