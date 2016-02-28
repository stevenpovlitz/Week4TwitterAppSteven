//
//  ProfileViewController.swift
//  TwitterDemoSteven
//
//  Created by Steven Povlitz on 2/28/16.
//  Copyright © 2016 Steven Povlitz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var profImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var userUniqName: UILabel!
    
    @IBOutlet weak var numTweetsLabel: UILabel!
    
    @IBOutlet weak var numFollowingLabel: UILabel!
    
    @IBOutlet weak var numFollowersLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
