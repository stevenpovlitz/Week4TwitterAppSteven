//
//  ProfileViewController.swift
//  TwitterDemoSteven
//
//  Created by Steven Povlitz on 2/28/16.
//  Copyright © 2016 Steven Povlitz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var tweet: Tweet!
    var user: User?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var profImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var userUniqName: UILabel!
    
    @IBOutlet weak var numTweetsLabel: UILabel!
    
    @IBOutlet weak var numFollowingLabel: UILabel!
    
    @IBOutlet weak var numFollowersLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TwitterClient.sharedInstance.currentAccount({ (user: User) -> () in
            
            self.user = user
            self.userNameLabel.text = user.name as? String
            self.userUniqName.text = user.screenname as? String
            
//            still need to format below, add and set appropriate members in User model
//            self.numTweetsLabel.text = String(user.tweetCount)
//            self.numFollowersLabel.text = String(user.followingCount)
//            self.numFollowersLabel.text = String(user.followersCount)
            
            self.profImageView.setImageWithURL(user.profileUrl!)
            self.profImageView.layer.cornerRadius = 4
//            self.backgroundImageView.setImageWithURL(user.profileBackgroundUrl!)
            self.backgroundImageView.layer.cornerRadius = 4
            
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
