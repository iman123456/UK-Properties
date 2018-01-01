//
//  ProfileViewController.swift
//  SwiftProject
//
//  Created by Admin on 12/29/17.
//  Copyright © 2017 eman. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var ParentView: UIView!
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var viewLeading: NSLayoutConstraint!
    var menuShowing = false
    
    @IBOutlet weak var oltEmail: UILabel!
    @IBOutlet weak var oltAccountName: UILabel!
    
    @IBOutlet weak var oltAge: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subView.layer.shadowOpacity = 1
        subView.layer.shadowRadius = 5
        
        
        print("hello from home")
        
        oltAccountName.text = "Welcome," + " " + UserDefaults.standard.string(forKey: "username")!
        
        
        oltEmail.text = "E-mail: " + UserDefaults.standard.string(forKey: "email")!
        
        oltAge.text = "Your age : " +  UserDefaults.standard.string(forKey: "age")!
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCallUs(_ sender: UIButton) {
        makeAPhoneCall()
    }
    
    //make a phone call
    func makeAPhoneCall()  {
        let url: NSURL = URL(string: "TEL://+201096045854")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        //end of call
    }
    
    @IBAction func btnMenuIsClicked(_ sender: UIBarButtonItem) {
        
        if menuShowing {
            viewLeading.constant = 0
            print("hello from click")
        }
        else{
            
            
            print("hello from else")
            viewLeading.constant = -140
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                self.ParentView.bringSubview(toFront: self.subView)
                
                
            })
            
        }
        
        menuShowing = !menuShowing
        
    }
    
}
