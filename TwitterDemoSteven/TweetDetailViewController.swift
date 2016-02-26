//
//  TweetDetailViewController.swift
//  TwitterDemoSteven
//
//  Created by Steven Povlitz on 2/25/16.
//  Copyright © 2016 Steven Povlitz. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    var tweet: Tweet!
    
    @IBOutlet weak var profPicImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var uniqNameLabel: UILabel!
    
    @IBOutlet weak var tweetBodyLabel: UILabel!
    
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var numRetweetsLabel: UILabel!
    
    @IBOutlet weak var numFavorites: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(tweet)
        
        userNameLabel.text = ("\(tweet.screenName)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
