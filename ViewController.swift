//
//  ViewController.swift
//  MidtermMakeup
//
//  Created by Evans, Jonathan on 3/29/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let urls = [
        "Popular Apps & Games" : ["https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json"],
        "Editors' Choice Games":["https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"],
        "Top Free Apps":["https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json"],
        "Top Grossing Apps":["https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"],
        "Top Paid Apps":["https://rss.itunes.apple.com/api/v1/us/ios-apps/top-paid/all/50/explicit.json"]
    ]
    
    var headers = [String]()
    var headerCode = "default"
    var url = "default"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        headers.append(contentsOf: urls.keys)
        //print(headers)
        //print(urls["Popular Apps & Games"]!)
        
       /* Alamofire.request("http://api.openweathermap.org/data/2.5/weather", method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{}} */
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        print("prepare for segue called !!")
        
        if segue.identifier == "toAppsList"{
            
            
            let indexPath = self.tableView.indexPathForSelectedRow
            headerCode = headers[indexPath!.row]
            let urlsInHeaders = urls[headerCode]
            url = urlsInHeaders![indexPath!.section]
            
            let destinationVC = segue.destination as! AppsListViewController
            destinationVC.headerCode = headerCode
            destinationVC.url = url
            
            
        }
    }
    
    
    
    
    

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = headers[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
}
