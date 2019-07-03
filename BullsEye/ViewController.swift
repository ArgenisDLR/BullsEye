//
//  ViewController.swift
//  BullsEye
//
//  Created by argenis delarosa on 5/24/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var totalScoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
    startNewRound()
  }
  
  @IBAction func showAlert() {
    
    let difference = abs(currentValue - targetValue)
    
    var points = 100 - difference
    
    score += points
    
    let title: String
    if difference == 0 {
      title = "Perfect score!"
      points += 100
    } else if difference < 5 {
      title = "oooh, so close!"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "pretty close"
    } else {
      title = "Not even close.."
    }
    
    let message = "You scored \(points) points!"

    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
    startNewRound()
    
  }
  
  @IBAction func slider(_ slider: UISlider) {
    let roundedValue = slider.value.rounded()
    currentValue = Int(slider.value)
  }
  
  func startNewRound() {
    
    round = round + 1
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
    
  }
  
  func updateLabels() {
    
    targetLabel.text = String(targetValue)
    totalScoreLabel.text = String(score)
    roundLabel.text = String(round)
    
  }

}

