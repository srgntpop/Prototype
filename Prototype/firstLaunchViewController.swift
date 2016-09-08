//
//  ViewController.swift
//  Prototype
//
//  Created by Anthony Parente on 8/2/16.
//  Copyright © 2016 Anthony Parente. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class firstLaunchViewController: UIViewController {
    
    @IBOutlet weak var f_NameText: UITextField!
    @IBOutlet weak var L_NameText: UITextField!
    @IBOutlet weak var eduText: UITextField!
    @IBOutlet weak var companyText: UITextField!
    @IBOutlet weak var positionText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    let avPlayerViewController = AVPlayerViewController()
    var avplayer:AVPlayer?
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(defaults.stringForKey("userFirstName") != nil){
            self.f_NameText.placeholder = defaults.stringForKey("userFirstName")
        }
        if(defaults.stringForKey("userLastName") != nil){
            self.L_NameText.placeholder = defaults.stringForKey("userLastName")
        }
        if(defaults.stringForKey("userEducation") != nil){
            self.eduText.placeholder = defaults.stringForKey("userEducation")
        }
        if(defaults.stringForKey("userCompanyName") != nil){
            self.companyText.placeholder = defaults.stringForKey("userCompanyName")
        }
        if(defaults.stringForKey("userOccupation") != nil){
            self.positionText.placeholder = defaults.stringForKey("userOccupation")
        }
        if(defaults.stringForKey("userEmail") != nil){
            self.emailText.placeholder = defaults.stringForKey("userEmail")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        if(self.defaults.stringForKey("introVidPlayed") == nil){
            let urlPathString:String? = NSBundle.mainBundle().pathForResource("final_animation_1", ofType: "mp4")
            let urlPath = urlPathString
            let movieUrl = NSURL(fileURLWithPath: urlPath!)
            self.avplayer = AVPlayer(URL: movieUrl)
            self.avPlayerViewController.player = self.avplayer
            self.presentViewController(self.avPlayerViewController, animated: true) { () -> Void in
                self.avPlayerViewController.player?.play()
            }
            self.defaults.setObject("has played", forKey: "introVidPlayed")
        }
    }
    
    @IBAction func personalInfoSubmitted(sender: AnyObject) {
        
        let fName = f_NameText.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let lName = L_NameText.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let edu = eduText.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let company = companyText.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let position = positionText.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let email = emailText.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        defaults.setObject(fName, forKey: "userFirstName")
        defaults.setObject(lName, forKey: "userLastName")
        defaults.setObject(edu, forKey: "userEducation")
        defaults.setObject(company, forKey: "userCompanyName")
        defaults.setObject(position, forKey: "userOccupation")
        defaults.setObject(email, forKey: "userEmail")
        
        
    }
      
    
    
}
