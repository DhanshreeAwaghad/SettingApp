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
    
    
    @IBAction func accountBtnTapped(_ sender: Any) {
        let popUpVC = self.storyboard?.instantiateViewController(identifier: "PopUpViewController") as! PopUpViewController
        popUpVC.modalPresentationStyle = .overCurrentContext
        popUpVC.modalTransitionStyle = .crossDissolve
        
        self.present(popUpVC, animated: true)
        
    }
    
}
