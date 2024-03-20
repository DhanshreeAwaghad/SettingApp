//
//  ManageViewController.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 20/03/24.
//

import UIKit

class ManageViewController: UIViewController {
    
    
    @IBOutlet weak var accountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.accountBtn.layer.cornerRadius = self.accountBtn.frame.height/2

    }
    

}
