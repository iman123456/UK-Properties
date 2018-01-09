//
//  ViewController.swift
//  SwiftProject
//
//  Created by Admin on 12/21/17.
//  Copyright © 2017 eman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var homeEmailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var outletLogin: UITextField!
    
    @IBOutlet weak var outletSignUp: UIButton!
    
   
    override func viewDidLoad() {
            super.viewDidLoad()
        
        self.title = " "

            // Receive
            print("hello from home")
            if let name = UserDefaults.standard.string(forKey: "username"), let email = UserDefaults.standard.string(forKey: "email"), let password = UserDefaults.standard.string(forKey: "password")
            {
                print(name,"\n",email,"\n",password)
                print(type(of: email))
                
            }
            
            //1- make keyboard disappers when touchs outside
            
            //Looks for single or multiple taps.
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
            
            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            tap.cancelsTouchesInView = false
            
            view.addGestureRecognizer(tap)
            
            super.viewDidLoad()
            self.hideKeyboardWhenTappedAround()
            
        }
        
        //Calls this function when the tap is recognized.
        func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
            view.endEditing(true)
        }
        
        func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        //end of keyboard disappearing

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
    }
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        let LoginEmail :String = homeEmailTxt.text!
        let LoginPassword :String = passwordTxt.text!
        
        //recieve data
        let password = UserDefaults.standard.string(forKey: "password")
        let email = UserDefaults.standard.string(forKey: "email")
        //end
        
        if LoginEmail == email && LoginPassword == password {
            print("equal values")
        }
        
        if LoginEmail == email! && LoginPassword == password {
            print("equal values")
            
//            let vc = SearchTableViewController(
//                nibName: "SearchViewController",
//                bundle: nil)
//            navigationController?.pushViewController(vc,
//                                                     animated: true)
            
        }
        else {
            //alert
            let alert = UIAlertController(title: "", message: "Please enter correct email and password!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //end of alert
        }
        
        
    }
    
}

    

