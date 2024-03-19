//
//  detailTableViewCell.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 19/03/24.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        imageBtn.layer.cornerRadius = self.imageBtn.frame.width/2
        

    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
