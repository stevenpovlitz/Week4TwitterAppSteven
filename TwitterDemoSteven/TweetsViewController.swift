//
//  TweetsViewController.swift
//  TwitterDemoSteven
//
//  Created by Steven Povlitz on 2/21/16.
//  Copyright © 2016 Steven Povlitz. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tweets: [Tweet]!
    
    // go through this tutorial, might need to rearrange a bunch of stuff https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson7.html
    
    @IBOutlet var tableViewController: UITableView!
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableViewController.reloadData()
            for tweet in tweets {
                print(tweet.text)
            }
            
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
        })
        // additional setup
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableViewController: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil{
            return tweets!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableViewController.dequeueReusableCellWithIdentifier("tweetCell", forIndexPath: indexPath) as! TweetCell
        
        cell.selectionStyle = .None
        cell.indTweet = tweets![indexPath.row]
        return cell
    }


}