//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Sebastien REMY on 03/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    let goal = 10
    
    var countries = [String]()
    var score = 0
    var corectAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        /*
         // Same thing
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
         */
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(alert: UIAlertAction! = nil) {
        
        // Shuffle
        countries.shuffle()
        corectAnswer = Int.random(in: 0...2)
        
        // Ask
        title = "\(countries[corectAnswer].uppercased()) \(score)/\(goal)"
        
        // Images
        button1.setImage(UIImage(named:  countries[0]), for: .normal)
        button2.setImage(UIImage(named:  countries[1]), for: .normal)
        button3.setImage(UIImage(named:  countries[2]), for: .normal)
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
   
        if sender.tag == corectAnswer {
            // Correct Answer
            score += 1
            if score >= goal {
                let alertMessage = "You reach \(goal) points"
                let alertAction = "Restart"
                score = 0
                let ac = UIAlertController(title: "Congratulations!", message: alertMessage, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: alertAction, style: .default, handler: askQuestion))
                
                present(ac, animated: true)
            } else {
                askQuestion()
            }
            
        } else {
            // Wrong Answer
            score -= 1
            let alertMessage = "That’s the flag of  \(countries[sender.tag].uppercased()).\r Your score is \(score)."
            let alertAction = "Continue"
            let ac = UIAlertController(title: "Wrong!", message: alertMessage, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: alertAction, style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
    
        
    }
    
}

