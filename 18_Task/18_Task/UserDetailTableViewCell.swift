//
//  UserDetailTableViewCell.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 28/03/24.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var reminderBtn: UIButton!
    
    @IBOutlet weak var blockBtn: UIButton!
    
    @IBOutlet weak var voicemailBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
