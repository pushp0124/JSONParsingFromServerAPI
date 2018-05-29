//
//  AlamDisplayTableViewCell.swift
//  FireAlamo
//
//  Created by Push_Parn on 28/05/18.
//  Copyright © 2018 Push_Parn. All rights reserved.
//

import UIKit

class AlamDisplayTableViewCell: UITableViewCell {
    
// A custom Table View Cell for AlamDisplayViewController
  
    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var FirstLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
