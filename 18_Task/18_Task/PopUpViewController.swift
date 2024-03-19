//
//  PopUpViewController.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 19/03/24.
//

import UIKit

class PopUpViewController: UIViewController {

    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var detailView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false  // if u tap on view it wont cancel
        self.view.addGestureRecognizer(tapGestureRecognizer)

        self.popUpView.layer.cornerRadius = 20
        self.detailView.layer.cornerRadius = 20
        self.topView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
      
    }
     @IBAction func crossBtnActionTapped(_ sender: Any) {
         self.dismiss(animated: true)
     }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: popUpView )
            //        sender.numberOfTapsRequired = 1
        if !popUpView.bounds.contains(location) {
            self.dismiss(animated: true)
        }
        else{
            self.dismiss(animated: true)
        }
    }
    
}
