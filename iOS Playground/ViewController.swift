//
//  ViewController.swift
//  iOS Playground
//
//  Created by Ralf Ren on 2018/11/4.
//  Copyright © 2018 Ralf Ren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairs: (btnCards.count + 1) / 2)
    
    var emojiChoices: [String] = ["🐱", "🦎", "🦉", "🐺", "🌛", "🔬", "🌃"]
    
    var flip_count = 0 {
        didSet {
            lblFlipsCount.text = "Flips: \(flip_count)"
        }
    }
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        // if identifier exists and still have choices, go on.
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in btnCards.indices {
            let button = btnCards[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            }
        }
    }
    
    @IBOutlet var btnCards: [UIButton]!
    @IBOutlet weak var lblFlipsCount: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        flip_count += 1
        if let card_number = btnCards.index(of: sender) {
            game.chooseCard(at: card_number)
            updateViewFromModel()
        } else {
            print("Card was not in btnCards")
        }
    }
}
