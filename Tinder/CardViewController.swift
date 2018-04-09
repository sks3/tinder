//
//  CardViewController.swift
//  Tinder
//
//  Created by somi on 4/6/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
  
  @IBOutlet var cardImageView: UIImageView!
  
  var cardInitialCenter: CGPoint!
  
  override func viewDidLoad() {
    
    let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanImage(sender:)))
    
    cardImageView.isUserInteractionEnabled = true
    cardImageView.addGestureRecognizer(panGestureRecognizer)
    
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  @objc func didPanImage(sender: UIPanGestureRecognizer) {
    let location = sender.location(in: view)
    let velocity = sender.velocity(in: view)
    let translation = sender.translation(in: view)
    
    
    if sender.state == .began {
      cardInitialCenter = cardImageView.center
      print(location.x)
      if translation.x > 0 {
        cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * M_PI / 180))
        //cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(translation.x/2))
      }
      else {
        cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * M_PI / 180))
      }
    }
    else if sender.state == .changed {
      if translation.x > 0 {
        cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * M_PI / 180))
        //cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(translation.x/2))
      }
      else {
        cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * M_PI / 180))
      }
      cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
      print(location.x)
    }
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
