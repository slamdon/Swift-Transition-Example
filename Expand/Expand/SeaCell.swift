//
//  SeaCell.swift
//  Expand
//
//  Created by don chen on 2017/2/3.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class SeaCell: UITableViewCell {

    @IBOutlet weak var aImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2
        layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
