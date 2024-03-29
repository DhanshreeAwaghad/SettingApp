//
//  PlusViewController.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 19/03/24.
//

import UIKit

class PlusViewController: UIViewController {
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var detailTableView: UITableView!
    
    let sectionOneTF = UITextField()
 
    let sectionOnePlaceholder = UITextPlaceholder()
    
    let prefixTF = UITextField()
    let firstNmTF = UITextField()
    let middleNmTF = UITextField()
    let lastNmTF = UITextField()
    let nameSuffixTF = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        emailView.layer.cornerRadius = self.emailView.frame.height/2
        emailView.layer.borderWidth = 1
        detailTableView.dataSource = self
        detailTableView.delegate = self
      
    }
    func registerCell(){
        let uinib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        self.detailTableView.register(uinib, forCellReuseIdentifier: "DetailTableViewCell")
        
        
    }
    func sectionOneHeader(){
        
    }
    func sectionTwoHeader(){
        
    }
    
    @IBAction func crossBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
extension PlusViewController : UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        5
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.detailTableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        return cell
    }
    
    
}
extension PlusViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        700.0
    }
    
}
