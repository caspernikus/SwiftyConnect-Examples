//
//  ViewController.swift
//  SwiftyConnect-Example
//
//  Created by Benedikt Veith on 17.04.18.
//  Copyright © 2018 benedikt-veith. All rights reserved.
//

import UIKit
import SwiftyConnect

class ViewController: UIViewController {
    
    let steem = Steem.sharedInstance
    
    @IBOutlet weak var authorizedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setAuthorizedLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setAuthorizedLabel() {
        if steem.auth.isAuthorized() {
            self.authorizedLabel.text = "Authorized"
        } else {
            self.authorizedLabel.text = "Unauthorized"
        }
    }
    
    @IBAction func authorize(_ sender: UIButton) {
        steem.auth.authorize() { jsonResponse in
            print(jsonResponse)
            DispatchQueue.main.async(execute: {() -> Void in
                self.setAuthorizedLabel()
            })
        }
    }
    
    @IBAction func revoke(_ sender: UIButton) {
        steem.auth.revoke { (success) in
            DispatchQueue.main.async(execute: {() -> Void in
                self.setAuthorizedLabel()
            })
        }
    }
}

