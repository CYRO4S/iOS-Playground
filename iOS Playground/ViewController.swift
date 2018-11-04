//
//  ViewController.swift
//  iOS Playground
//
//  Created by Ralf Ren on 2018/11/4.
//  Copyright © 2018 Ralf Ren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnCards: [UIButton]!
    @IBOutlet weak var lblFlipsCount: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        flip_count += 1
        if let card_number = btnCards.index(of: sender) {
            print("Card #: \(card_number)")
            flipCard(with: emojiChoices[card_number], on: sender)
        } else {
            print("Card was not in btnCards")
        }
    }
    
    var emojiChoices: [String] = ["🐱", "🦎", "🦉", "🐱", "🦎", "🦉"]
    
    var flip_count = 0 {
        didSet {
            lblFlipsCount.text = "Flips: \(flip_count)"
        }
    }
    
    func flipCard(with str: String, on button: UIButton) {
        if button.currentTitle == str {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        } else {
            button.setTitle(str, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

