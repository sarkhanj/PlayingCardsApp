//
//  CardSelectionVC.swift
//  PlayingCardsApp
//
//  Created by Sarkhan Jafarli on 8/29/22.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var timer: Timer!
    var cards: [UIImage] = Deck.allCards
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }

    @objc func showRandomImage(){
        if let randomElement = cards.randomElement() {
            cardImageView.image = randomElement
        }else{
            cardImageView.image = UIImage(named: "AS")
            print("The array of images is empty")
        }
            
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        timer.invalidate()
    }
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
