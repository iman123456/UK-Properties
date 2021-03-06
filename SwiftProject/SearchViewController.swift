//
//  SearchViewController.swift
//  SwiftProject
//
//  Created by Admin on 12/28/17.
//  Copyright © 2017 eman. All rights reserved.
//

import UIKit
import DTLoadingIndicator
class SearchViewController: UIViewController {
    
    var menuShowing = false
    
//    @IBOutlet weak var city: UITextField!
//    @IBOutlet weak var propertyType: UITextField!
    
    @IBOutlet weak var typeSearch: UITextField!
    @IBOutlet weak var citySearch: UITextField!
    @IBOutlet weak var ParentView: UIView!
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var viewLeading: NSLayoutConstraint!

  
//    var property_Type = propertyType.text

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subView.layer.shadowOpacity = 1
        subView.layer.shadowRadius = 5
//        display indicator`
//                DTLoadingIndicator.startFullScreenLoadingIndicator()
//        end of calling indicator
        
//        1- make keyboard disappers when touchs outside
        
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     
     */
    
    @IBAction func btnSearch(_ sender: UIButton) {
       
        if citySearch.text == "" {
            //alert
            let alert = UIAlertController(title: "", message: "enter the city!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //end of alert
        }
        
        if !(citySearch.text == "London" || citySearch.text == "Northern Ireland" || citySearch.text == "Scotland" || citySearch.text == "Wales") {
            //alert
            let alert = UIAlertController(title: "", message: "enter a valid city!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //end of alert
        }
        
        if typeSearch.text == "" {
            //alert
            let alert = UIAlertController(title: "", message: "enter the type!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //end of alert
        }
        
        if !( typeSearch.text == "rent" ||  typeSearch.text == "sharing" || typeSearch.text == "buy" ){
            //alert
            let alert = UIAlertController(title: "", message: "enter a valid type!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //end of alert
        }

        else{
            UserDefaults.standard.setValue(citySearch.text, forKey: "city")
            print("\(UserDefaults.standard.value(forKey: "city")!)")
            
            UserDefaults.standard.setValue(typeSearch.text, forKey: "typeP")
            print("\(UserDefaults.standard.value(forKey: "typeP")!)")
            


            
        }
    }
    
    
    
    @IBAction func menuIsClicked(_ sender: UIBarButtonItem) {
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
