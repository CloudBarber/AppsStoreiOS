//
//  AppDetailsViewController.swift
//  MidtermMakeup
//
//  Created by Evans, Jonathan on 3/29/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class AppDetailsViewController: UIViewController {

    var app:App?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test")

        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func closeButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "closeWindow", sender: nil)
    }
    

}
