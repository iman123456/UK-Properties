//
//  RegisterViewController.swift
//  SwiftProject
//
//  Created by Admin on 12/22/17.
//  Copyright © 2017 eman. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var fullnameTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    
    
    
    
    override func viewDidLoad() {
        //1- make keyboard disappers when touchs outside
        self.title = " "

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
        let RegisterfullName :String = fullnameTxt.text!
        let RegisterEmail = emailTxt.text
        let RegisterPassword :String = passwordTxt.text!
        let RegisterConfirmPassword :String = confirmPasswordTxt.text!
        let RegiserAge :String = ageTxt.text!
        
        //validation
        
        //        //fullname
        if (RegisterfullName.characters.count < 6 || RegisterfullName.isEmpty) {
            //alert
            let alert = UIAlertController(title: "", message: "enter a name more than 6 characters!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //end of alert
            
        }
            
        else{
            let RegEx = "\\A\\w{7,18}\\z"
            let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
            if (Test.evaluate(with: RegisterfullName)){
                //alert
                let alert = UIAlertController(title: "", message: "username must start awith capital letters", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                //end of alert
                
            }
        }
        //end of fullname
        
        //age
        
        if RegiserAge != "" {
            let intAge = Int(RegiserAge)
            
            if  intAge! < 4 || intAge! > 100 {
                //alert
                let alert = UIAlertController(title: "", message: "enter a real age!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                //end of alert
                //end of age
            }}
        
        //end of age
        
        //email
        if (RegisterEmail?.isEmpty)!  {
            //alert
            let alert = UIAlertController(title: "", message: "Please enter your email!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //end of alert
            
            
        }
        else{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if (emailTest.evaluate(with: RegisterEmail)){
                print("true")
            }
            else{
                let alert = UIAlertController(title: "", message: "Please enter a valid email!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                //end of alert
                
            }
        }
        //end of email validation
        
        //password
        if RegisterPassword.characters.count > 0 {
            
            /*1 - Password length is 8.
             2 - One Alphabet in Password.
             3 - One Special Character in Password.
             
             
             Explanation:
             
             ^                              - Start Anchor.
             (?=.*[a-z])              -Ensure string has one character.
             (?=.[$@$#!%?&])   -Ensure string has one special character.
             {8,}                            -Ensure password length is 8.
             $                               -End Anchor.
             let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,}")
             */
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{6,}")
            print("password", passwordTest.evaluate(with: RegisterPassword))
            
            
            if passwordTest.evaluate(with: RegisterPassword) == false{
                //alert
                let alert = UIAlertController(title: "", message: "enter a password at least 8 with one character!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        //end of password
        
        
        //confirm password
        if RegisterConfirmPassword != RegisterPassword {
            //alert
            let alert = UIAlertController(title: "", message: "enter equal password!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //end of alert
        }
        
        //end of confirm password
        
        
        UserDefaults.standard.setValue(RegisterfullName, forKey: "username")
        print("\(UserDefaults.standard.value(forKey: "username")!)")
        
        UserDefaults.standard.setValue(RegisterEmail, forKey: "email")
        print("\(UserDefaults.standard.value(forKey: "email")!)")
        
        UserDefaults.standard.setValue(RegisterPassword, forKey: "password")
        print("\(UserDefaults.standard.value(forKey: "password")!)")
        
        UserDefaults.standard.setValue(RegiserAge, forKey: "age")
        
        //change controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("hello after flags")
        
        
        
    }
    
    
}
