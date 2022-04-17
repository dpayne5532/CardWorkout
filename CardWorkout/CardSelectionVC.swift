//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Dan Payne on 4/17/22.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    var timerRunning: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startTimer()
    
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }

    @objc func showRandomImage() {
        
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
       
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        if timerRunning == true {
            timerRunning.toggle()
        timer.invalidate()
        } else {
            return
        }
        
        
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        if timerRunning == false {
            timerRunning.toggle()
            startTimer()
        } else  {
            return
        }
        
       
        
    }
    
 
}
