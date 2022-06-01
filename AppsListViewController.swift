//
//  AppsListViewController.swift
//  MidtermMakeup
//
//  Created by Evans, Jonathan on 3/29/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class AppsListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var headerCode: String?
    var url: String?
    var iconUrl: String?
    var name: String?
    var dataArray = [JSON]()
    var index: Int?
    var arrayValue: Int?
    var apps = [App]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "AppsCell")
        print("The button clicked was: \(headerCode!)")
        print("The url is: \(url!)")
        
        
        // Do any additional setup after loading the view.
        
        Alamofire.request(url!).responseJSON { (response) in
            if response.result.isSuccess{
                print("Success")
                let data = JSON(response.result.value!)
                //print(data)
                self.dataArray = data["feed"]["results"].arrayValue
                
                for item in data["feed"]["results"].arrayValue {
                    print(item)
                    let app = App(json: item)
                    self.apps.append(app)
                    
                }
                
                
                let genreArray = data["feed"]["results"]["genres"].arrayValue
                //print(self.dataArray)
                print ("Data Array count: \(self.dataArray.count)")
                self.arrayValue = self.dataArray.count
                var genres = [String]()
                for i in 0..<genreArray.count{
                    genres[i] = genreArray[i]["name"].stringValue
                }
                
               // self.iconUrl = self.dataArray[self.index!]["artworkUrl100"].stringValue
               
             /*  Alamofire.request(self.dataArray[self.index!]["artworkUrl100"].stringValue).responseImage { (response) in
                    if response.result.isSuccess{
                        print("image Response")
                       
                        
                    }
                    else{
                        print("image Failure")
                    }
                } */
             
                self.tableView.reloadData()
            }
            else{
                print("Failed")
            }
            
        }
      
        
    }
    
    @IBAction func myUnwind(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAppDetails"{
            
            let app = self.apps[tableView.indexPathForSelectedRow!.row]
            
            let vc = segue.destination as! AppDetailsViewController
            vc.app = app
            
            
            
        }
    }
  

}




extension AppsListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppsCell", for: indexPath) as! CustomTableViewCell
        print ("Data Array count in Cell View: \(self.dataArray.count)")
        
        let app = self.apps[indexPath.row]
        
        cell.appNameLabel.text = app.name
        cell.developerNameLabel.text = app.artistName
        cell.releaseDateLabel.text = "Release Date: \(app.releaseDate!)"
        
        cell.genreLabel.text = app.genres.joined(separator: ",")
        
        cell.imageOutlet.af_setImage(withURL: app.artworkUrl100!, placeholderImage: UIImage(named: "loading")!)
        
        
        return cell
    }
    
    
}




extension AppsListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        self.performSegue(withIdentifier: "toAppDetails", sender: self)
       
    }
}
