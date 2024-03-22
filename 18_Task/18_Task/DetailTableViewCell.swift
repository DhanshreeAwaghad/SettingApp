//
//  detailTableViewCell.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 19/03/24.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    
    @IBOutlet weak var companyTopViewConstraint: NSLayoutConstraint!
    
    var arr1 : [String] = ["No label","Mobile","Work","Home","Main","Work Fax","Home Fax","Pager","Other","Custom"]
    var arr2 : [String] = ["No label","Home","Work","Other","Custom"]
    var arr3 : [String] = ["No label","Birthday","Anniversary","Other","Custom"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    
    var isAllTextFieldsVisible = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableViewHeightConstraint.constant = 0
    
        textField3.isHidden = true
        textField4.isHidden = true
        textField5.isHidden = true
        companyTopViewConstraint.constant = -100
      
        
    }
    func registerCell(){
        let uinib = UINib(nibName: "SubTableViewCell", bundle: nil)
        tableView.register(uinib, forCellReuseIdentifier: "SubTableViewCell")
    }
    @IBAction func toggleTextFields(_ sender: UIButton) {
       sender.isSelected = !sender.isSelected
        if sender.isSelected{
            
            companyTopViewConstraint.constant = -100
        }
        else{
            
            companyTopViewConstraint.constant = 20
        }
        textField3.isHidden = !isAllTextFieldsVisible
        textField4.isHidden = !isAllTextFieldsVisible
        textField5.isHidden = !isAllTextFieldsVisible
        

        isAllTextFieldsVisible = !isAllTextFieldsVisible
    }
    
    @IBAction func mobileBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            self.tableViewHeightConstraint.constant = 200
            self.tableView.reloadData()
        }
        else{
            self.tableView.reloadData()
            self.tableViewHeightConstraint.constant = 0
        }
        
    }
    
}

extension DetailTableViewCell : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "SubTableViewCell", for: indexPath) as! SubTableViewCell
        cell.backgroundColor = .brown
        cell.subName.text = arr1[indexPath.row]
        return cell

    }
    
    
}
extension DetailTableViewCell : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}
