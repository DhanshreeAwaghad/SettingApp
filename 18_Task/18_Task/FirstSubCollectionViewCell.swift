//
//  FirstSubCollectionViewCell.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 21/03/24.
//

import UIKit

class FirstSubCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstImageView.layer.cornerRadius = firstImageView.frame.height/2
        firstImageView.layer.borderWidth = 0.5
        firstImageView.layer.borderColor = UIColor.black.cgColor

    }
}
