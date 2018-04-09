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
    let translation = sender.translation(in: view)
    
    if sender.state == .began {
      cardInitialCenter = cardImageView.center
      if location.y < cardImageView.center.y {
        cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 180))
      }
      else {
        cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-Double(translation.x) * Double.pi / 180))
      }
    }
    else if sender.state == .changed {
      if location.y < cardImageView.center.y {
        cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 180))
      }
      else {
        cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-Double(translation.x) * Double.pi / 180))
      }
      cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
    }
    else if sender.state == .ended {
      print(translation.x)
      if translation.x > 50 {
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: { () -> Void in
          self.cardImageView.center.x += self.view.frame.width
        }, completion: nil)
      }
      else if translation.x < -50 {
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: { () -> Void in
          self.cardImageView.center.x -= self.view.frame.width
        }, completion: nil)
      }
      else {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: { () -> Void in
          self.cardImageView.transform = CGAffineTransform.identity
        }, completion: nil)
      }
    }
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
