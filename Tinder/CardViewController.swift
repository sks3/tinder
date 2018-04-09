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
    //cardImageView.transform = cardImageView.transform.rotated(by:location)
    
    if sender.state == .began {
      cardInitialCenter = cardImageView.center
    }
    else if sender.state == .changed {
      cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
    }
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
