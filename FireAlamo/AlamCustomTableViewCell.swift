//
//  AlamCustomTableViewCell.swift
//  FireAlamo
//
//  Created by Push_Parn on 27/05/18.
//  Copyright © 2018 Push_Parn. All rights reserved.
//

import UIKit

class AlamCustomTableViewCell: UITableViewCell {
    
// A custom Table View Cell for TableView defined in ViewController
    
    @IBOutlet weak var AlamCustomLabel: UILabel!
    @IBOutlet weak var AlamCustomView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
