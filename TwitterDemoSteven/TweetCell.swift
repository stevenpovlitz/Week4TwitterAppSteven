//
//  TweetCell.swift
//  TwitterDemoSteven
//
//  Created by Steven Povlitz on 2/22/16.
//  Copyright © 2016 Steven Povlitz. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    // where all the outlets should go, that are in an individual cell
    @IBOutlet weak var profPicImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var uniqNameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var tweetBodyLabel: UILabel!
    
    @IBOutlet weak var reTweetLabel: UILabel!
    @IBOutlet weak var fvTweetLabel: UILabel!
    
    
    @IBAction func rtButton(sender: UIButton) {
        
    }
    @IBAction func fvButton(sender: UIButton) {
        
    }
    
    var indTweet: Tweet! {
        didSet{
            // incase I want to use them later
            reTweetLabel.hidden = true
            fvTweetLabel.hidden = true

            // set outlets to values (ex nameLabel.text = indTweet.text
            
            profPicImageView.setImageWithURL((indTweet.user?.profileUrl)!)
            
            //userNameLabel.text = indTweet.user.name as? String
            //uniqNameLabel.text  = indTweet.screenName as? String
            //timeStampLabel.text = indTweet.timestamp as String
            
            userNameLabel.text = indTweet.user?.name as? String
            uniqNameLabel.text = "@\(indTweet.user!.screenname!)"
            tweetBodyLabel.text = indTweet.text as? String
            timeStampLabel.text = indTweet.timeSince
            
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profPicImageView.layer.cornerRadius = 3
        profPicImageView.clipsToBounds = true
        
        //userNameLabel.preferredMaxLayoutWidth = userNameLabel.frame.size.width
        
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        userNameLabel.preferredMaxLayoutWidth = userNameLabel.frame.size.width
//        
//    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
