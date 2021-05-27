//
//  ViewController.swift
//  DemoApp
//
//  Created by Gaurav Korde on 5/26/21.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Alamofire.request("https://api.artic.edu/api/v1/artworks/129884").responseJSON { response in
            switch response.result {
                case .success(let value):
                 let json = JSON(value)
                
                 print(json) //Print API response
                 print("------------------------------------")
                //Getting a string value from JSON response
                if let placeOfOrigin = json["data"]["place_of_origin"].string {
                    print("Place of Origin: " + placeOfOrigin)
                }
                print()
                //Getting Start Year value from JSON response
                if let startYear = json["data"]["date_start"].int {
                    print("Start Year: \(startYear)")
                }
                print()
                if let endYear = json["data"]["date_end"].int {
                    print("End Year: \(endYear)")
                }
                print()
                print("****Category Titles****")
                //Getting an Array of Strings from JSON response
                for categoryTitle in json["data"]["category_titles"].arrayValue {
                    print(categoryTitle)
                }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

