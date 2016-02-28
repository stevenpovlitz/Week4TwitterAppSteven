//
//  ComposeViewController.swift
//  
//
//  Created by Steven Povlitz on 2/27/16.
//
//

import UIKit

class ComposeViewController: UIViewController {
    
    var tweet: Tweet?
    
    @IBOutlet weak var centerTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.centerTextField.text = "What's on your mind?"
        
        if tweet != nil {
            //self.centerTextField.text = "@\(tweet!.name! as? String)"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func postTweetButton(sender: AnyObject) {
        TwitterClient.sharedInstance.compose(self.centerTextField.text, success: { (Tweet) -> () in
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }
        self.navigationController!.popViewControllerAnimated(true)
        
    }
    

}
