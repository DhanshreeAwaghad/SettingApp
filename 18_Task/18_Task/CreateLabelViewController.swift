//
//  CreateLabelViewController.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 20/03/24.
//

import UIKit

class CreateLabelViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var nameLabelTF: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var enteredName : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 30
        
        self.okBtn.isEnabled = false
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false  // if u tap on view it wont cancel
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        
        nameLabelTF.delegate = self
        labelView.layer.borderWidth = 1
        labelView.layer.borderColor = UIColor.blue.cgColor
        self.topView.backgroundColor = UIColor.black.withAlphaComponent(0.6)

        self.nameLabelTF.keyboardType = .asciiCapable
        self.nameLabelTF.becomeFirstResponder()
        
    }
    
    @IBAction func okBtnAction(_ sender: Any) {
        enteredName = self.nameLabelTF.text
        if let name = enteredName,!name.isEmpty{
            
            print("entereeNAme : \(enteredName ?? "")")
            self.okBtn.isEnabled = true
        }
        else{
            self.okBtn.isEnabled = false

            self.labelView.layer.borderColor = UIColor.red.cgColor
            self.nameLabelTF.placeholder = "Please enter name first"
        }
        
    }
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: popUpView )
            //        sender.numberOfTapsRequired = 1
        if !popUpView.bounds.contains(location) {
            self.dismiss(animated: true)
        }
        else{
                // self.dismiss(animated: true)
        }
    }
}
extension CreateLabelViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.labelView.layer.borderColor = UIColor.blue.cgColor
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        self.okBtn.isEnabled = true
        self.labelView.layer.borderColor = UIColor.blue.cgColor
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        var textFieldText = textField.text
        if let textFieldText = textFieldText,textFieldText.count == 0{
            self.labelView.layer.borderColor = UIColor.red.cgColor

        }
        else{
            self.okBtn.isEnabled = true
            self.labelView.layer.borderColor = UIColor.blue.cgColor
        }
    }
}
