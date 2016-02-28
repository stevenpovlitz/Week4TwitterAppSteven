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
    var userName: String?
    
    @IBOutlet weak var profPicImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel! // problem outlet
    
    @IBOutlet weak var uniqNameLabel: UILabel!
    
    @IBOutlet weak var tweetBodyLabel: UILabel!
    
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var numRetweetsLabel: UILabel!
    
    @IBOutlet weak var numFavorites: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(tweet)
        profPicImageView.setImageWithURL((tweet.user?.profileUrl)!)
        
        uniqNameLabel.text = "@\(tweet.user!.screenname!)"
        tweetBodyLabel.text = tweet.text as? String
        timeStampLabel.text = tweet.timeSince
        
        print (userName)
        userNameLabel.text = userName
        
        //userNameLabel.text = ("\(tweet.screenName)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func replyButtonAction(sender: AnyObject) {
        print("Reply Button Pressed")
        //TODO: Implement Reply button
    }
    
    @IBAction func retweetButtonAction(sender: AnyObject) {
        print("Retweet Button Pressed")
        //TODO: Implement Retweet button
    }
    
    @IBAction func favoriteButtonAction(sender: AnyObject) {
        TwitterClient.sharedInstance.favorite(tweet.tweetID!, success: { (Tweet) -> () in
            print("favorited")
// increment a favorites label here
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let composeViewController = segue.destinationViewController as! ComposeViewController
        print(self.tweet.screenName)
        composeViewController.tweet = self.tweet
    }

}
