//
//  SideMenuViewController.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 20/03/24.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    var uiAlertController : UIAlertController?
    
    var okAction : UIAlertAction?
    var cancelAction : UIAlertAction?
    var nameTextField : UITextField?
    var passwordTextField : UITextField?
    
    @IBOutlet weak var accountView: UIView!
    
    @IBOutlet weak var firstTopView: UIView!
    @IBOutlet weak var sideView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(actionTap(_ :)))
        gesture.cancelsTouchesInView = false
        self.firstTopView.addGestureRecognizer(gesture)
        
        accountView.layer.cornerRadius = self.accountView.frame.height/2
        
        firstTopView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
     
        func showAlert() {
                // Create an alert controller
            let alertController = UIAlertController(title: "Alert", message: "This is an alert message.", preferredStyle: .alert)
            
                // Add an action (button)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
                // Present the alert controller
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func alertWithTextFieldClicked(){
        uiAlertController = UIAlertController(title: "Create label", message: "Label name", preferredStyle: .alert)
        okAction = UIAlertAction(title: "Okay", style: .default){
            (action) in
            print("OK btn has been pressed")
        }
        //cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        cancelAction = UIAlertAction(title: "cancel", style: .cancel){ (action) in
            print("Cancel btn Clicked")
        }
        uiAlertController?.addAction(okAction!)
        uiAlertController?.addAction(cancelAction!)

       
        
        //uiAlertController?.addAction(cancelAction!)
        
        uiAlertController?.addTextField(configurationHandler: { (textField) in
            self.nameTextField = textField
            //self.nameTextField?.placeholder = "Enter your name here"
            self.nameTextField?.textColor = .brown
        })
        //self.present(uiAlertController!, animated: true)
        present(uiAlertController!, animated: true, completion: nil)
        
    }
    
    @objc func actionTap(_ sender : UIGestureRecognizer){
        let loc = sender.location(in: sideView)
        if !sideView.bounds.contains(loc){
            self.dismiss(animated: true)
          //  print("outside side view tapped")

        }
        else{
            print("outside side view tapped")
        }
    }
    
    @IBAction func createBtnTapped(_ sender: UIButton) {
        let sideVC = self.storyboard?.instantiateViewController(identifier: "ContactsViewController") as! ContactsViewController
        sideVC.isComingFromSideMenu  = true
        sideVC.modalPresentationStyle = .overCurrentContext
        sideVC.modalTransitionStyle = .crossDissolve
        
        self.present(sideVC, animated: true)
//    func hideSideMenuAndShowBackgroundTopView() {
//        self.dismiss(animated: true)
//        
//            // Dismiss the current view controller with a delay
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            let sideVC = self.storyboard?.instantiateViewController(identifier: "ContactsViewController") as! ContactsViewController
//            sideVC.isComingFromSideMenu  = true
//            sideVC.modalPresentationStyle = .overCurrentContext
//            sideVC.modalTransitionStyle = .crossDissolve
//           
//            self.present(sideVC, animated: true)
//        }
    }
}

