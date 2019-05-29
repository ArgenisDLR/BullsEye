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

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func showAlert() {
    
    let message = "the value of the slider is now: \(currentValue)"

    let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
  }
  
  @IBAction func slider(_ slider: UISlider) {
    let roundedValue = slider.value.rounded()
    currentValue = Int(slider.value)
  }

}
