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
    
    @IBOutlet var tableViewCo: UITableView!
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableViewCo.delegate = self
        tableViewCo.dataSource = self
        
        // below 2 used so autolayout can work
        
        //tableViewCo.rowHeight = UITableViewAutomaticDimension
        tableViewCo.rowHeight = 140
        tableViewCo.estimatedRowHeight = 120
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableViewCo.reloadData()
//            for tweet in tweets {
//                //print(tweet.text)
//            }
            
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
        })
        // additional setup
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableViewCo: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil{
            return tweets!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableViewCo.dequeueReusableCellWithIdentifier("tweetCell", forIndexPath: indexPath) as! TweetCell
        
        cell.selectionStyle = .None
        cell.indTweet = tweets![indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "tweetClicked"){
            let cell = sender as! UITableViewCell
            let indexPath = tableViewCo.indexPathForCell(cell)
            let tweet = tweets![indexPath!.row]
            let tweetDetailViewController = segue.destinationViewController as! TweetDetailViewController
            
            tweetDetailViewController.userName = tweet.name
            
            tweetDetailViewController.tweet = tweet
        }
    }


}