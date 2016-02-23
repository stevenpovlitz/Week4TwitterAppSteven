//
//  User.swift
//  TwitterDemoSteven
//
//  Created by Steven Povlitz on 2/21/16.
//  Copyright © 2016 Steven Povlitz. All rights reserved.
//

import UIKit

class User: NSObject {
    
    // 'stored properties'
    var name: NSString?
    var screenname: NSString?
    var profileUrl: NSURL?
    var tagline: NSString?
    
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) { // deserialization code
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
        
        tagline = dictionary["description"] as? String
    }
    
    // 'computed properties' - not a piece of storage associated with var
    static var _currentUser: User?
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    class var currentUser: User? {
        get {
        if _currentUser == nil {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let userData = defaults.objectForKey("currentUserData") as? NSData
        
        if let userData = userData {
        let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
        _currentUser = User(dictionary: dictionary)
        }
        
        
        }
        
        return _currentUser
        }
        
        set(user) {
            _currentUser = user
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user=user { // ie user isn't nil
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: "currentUserData")
            } else {
                defaults.setObject(nil, forKey: "currentUserData")
            }
            
            defaults.synchronize() // like hitting "save"
        }
    }
}
