//
//  ViewController.swift
//  Flair
//
//  Created by Brandon Hewer on 14/11/2015.
//  Copyright © 2015 Brandon Hewer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hello: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shuffle(sender: AnyObject) {
        weak var newCrypto:CryptoKey?;
        let newString = newCrypto!.generateKey("hello", typeChoice: 2)
        hello.text=newString
    }

    @IBAction func binary(sender: AnyObject) {
        weak var newCrypto:CryptoKey?;
        let newString = newCrypto!.generateKey("hello", typeChoice: 3)
        hello.text=newString
    }
    
    @IBAction func hex(sender: AnyObject) {
        weak var newCrypto:CryptoKey?;
        let newString = newCrypto!.generateKey("hello", typeChoice: 1)
        hello.text=newString
    }
}

