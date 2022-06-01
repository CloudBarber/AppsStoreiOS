//
//  CustomTableViewCell.swift
//  MidtermMakeup
//
//  Created by Evans, Jonathan on 3/29/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    @IBOutlet weak var appNameLabel: UILabel!
    
    
    @IBOutlet weak var developerNameLabel: UILabel!
    
    
    @IBOutlet weak var genreLabel: UILabel!
    
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
