//
//  Tweet.swift
//  TwitterDemoSteven
//
//  Created by Steven Povlitz on 2/21/16.
//  Copyright © 2016 Steven Povlitz. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    
    //newly created
    var userProfPic: NSURL?
    var screenName: String?
    var name: String?
    var timeSince: String?
    var timePassed: Int?
    
    //a user
    var user: User?
    
    internal var tweetsLs: [Tweet]!
    
    init(dictionary: NSDictionary){
        
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        
        text = dictionary["text"] as? String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0 // try to have it as an int, if it can't be had as an int, use 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        userProfPic = dictionary["profile_image_url_https"] as? NSURL
        screenName = dictionary["screen_name"] as? String
        name = dictionary["name"] as? String
        
        let timestampString = dictionary["created_at"] as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MM d HH:mm:ss Z Y"
        timestamp = formatter.dateFromString(timestampString!)
        
        let now = NSDate()
        let then = timestamp
        timePassed = Int(now.timeIntervalSinceDate(then!))
        
        // creds for this function go to @dylan-james-smith from ccsf
        if timePassed >= 86400 {
            timeSince = String(timePassed! / 86400)+"d"
        }
        if (3600..<86400).contains(timePassed!) {
            timeSince = String(timePassed!/3600)+"h"
        }
        if (60..<3600).contains(timePassed!) {
            timeSince = String(timePassed!/60)+"m"
        }
        if timePassed < 60 {
            timeSince = String(timePassed!)+"s"
        }
        
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        print(dictionaries)
        var tweets = [Tweet]()
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }

}
