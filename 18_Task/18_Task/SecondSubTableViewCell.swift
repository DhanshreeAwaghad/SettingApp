//
//  SecondSubTableViewCell.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 21/03/24.
//

import UIKit

class SecondSubTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondImageView.layer.cornerRadius = secondImageView.frame.height/2
        secondImageView.layer.borderWidth = 0.5
        secondImageView.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
