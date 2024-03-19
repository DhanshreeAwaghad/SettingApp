//
//  ContactNmTableViewCell.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 18/03/24.
//

import UIKit

class ContactNmTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contactNm: UILabel!
    
    @IBOutlet weak var contactIImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        contactIImg.layer.cornerRadius = contactIImg.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
