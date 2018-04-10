//
//  ProfileViewController.swift
//  Tinder
//
//  Created by somi on 4/9/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet var profileImage: UIImageView!
  var mainImage: UIImage!
  

  override func viewDidLoad() {
    profileImage.image = mainImage
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func didClickDone(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  
  
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
