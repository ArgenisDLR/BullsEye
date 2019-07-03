//
//  ViewController.swift
//  BullsEye
//
//  Created by argenis delarosa on 5/24/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue: Int = 0
  var targetValue: Int = 0
  
  @IBOutlet weak var slider: UISlider!
  
  @IBOutlet weak var targetLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    currentValue = Int()
    targetValue = Int.random(in: 1...100)
    startNewRound()
  }
  
  @IBAction func showAlert() {
    
    var difference : Int
    
    if currentValue > targetValue {
      difference = currentValue - targetValue
    } else if targetValue > currentValue {
      difference = targetValue - currentValue
    } else {
      difference = 0
    }
    
    let message = "the value of the slider is now: \(currentValue)"

    let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
    
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
    
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
  }

}

