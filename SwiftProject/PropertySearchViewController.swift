//
//  PropertySearchViewController.swift
//  SwiftProject
//
//  Created by Admin on 1/3/18.
//  Copyright © 2018 eman. All rights reserved.
//

import UIKit
import Alamofire
import DTLoadingIndicator
//import SwiftyJSON
//import AlamofireImage
import SDWebImage
class PropertySearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let URL_Get_Data = "https://api.nestoria.co.uk/api?"
    

    @IBOutlet weak var tableViewProperty: UITableView!
    
    var properties = [Property]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return properties.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PropertyTableViewCell
        
        let item = properties[indexPath.row]
        
        cell.propertyPrice.text = item.price
        cell.propertyTitle.text = item.title
        if let img_url: URL = URL(string: item.imageUrl ?? ""){
            cell.propertyImage.sd_setImage(with: img_url)
        }
        
//        let property :Property
//        property = properties[indexPath.row]
//        cell.propertyTitle.text = property.title
//        cell.propertyPrice.text = property.price
//        if property.imageUrl != nil {
//
//        Alamofire.request(property.imageUrl!).responseImage { response in
//            debugPrint(response)
//
//            if let image = response.result.value {
//                cell.propertyImage.image = image
//            }
//            else{
//                print("no image")
//            }
//            }}
        
        return cell
    }


       override func viewDidLoad() {
        super.viewDidLoad()

            //fetching data from web api
        //recieve data
        let city :String = UserDefaults.standard.string(forKey: "city") ?? "london"
        
        let type :String = UserDefaults.standard.string(forKey: "typeP") ?? "buy"
        
        print("search values are :",city,type)
        let params: [String: String] = ["encoding": "json", "pretty": "1", "action": "search_listings", "country": "uk", "listing_type": type, "place_name": city]
        

        //end
        
        
//        
        Alamofire.request(URL_Get_Data, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate(statusCode: 200..<600).responseJSON {
            response in
        
            //getting json
            if let json = response.result.value {
                print(type(of: json))
                //converting json to NSArray
                
                let propertyArray = json as! NSDictionary
                let dict = propertyArray.value(forKey: "response") as! NSDictionary
                
                let listings = dict.value(forKey: "listings") as! NSArray
                
                for item in listings {
                    let itemValue = item as! NSDictionary
                    
                    let img_url = itemValue.value(forKey: "img_url") as? String ?? ""
                    let _title = itemValue.value(forKey: "title") as? String ?? ""
                    let price_formatted = itemValue.value(forKey: "price_formatted") as? String ?? ""

                    let proparty = Property.init(title: _title, price: price_formatted, imageUrl: img_url)
                    self.properties.append(proparty)
                }
                self.tableViewProperty.reloadData()
                
                
                //traversing through all elements of the array
//                for i in 0..<propertyArray.count{
//
//                    //adding hero values to the hero list
//                    self.properties.append(Property(
//                        title: (propertyArray[i] as AnyObject).value(forKey: "title") as? String,
//                        price: (propertyArray[i] as AnyObject).value(forKey: "price_formatted") as? String,
//                        imageUrl: (propertyArray[i] as AnyObject).value(forKey: "imageUrl") as? String
//                    ))
//
//                }
//
                //displaying data in tableview
            }
        }
        
    }}
