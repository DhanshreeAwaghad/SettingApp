//
//  SecondTableViewCell.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 21/03/24.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var secondTableView: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var biewBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    
    var arr1 : [String] = ["Aaradhya","Aboli","Bhavika","Chameli","Dipti"]
    var arr2 : [String] = ["a1","a2","a3","a4","a5"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        topView.layer.cornerRadius = 10
        btnView.layer.cornerRadius = 20
        btnView.layer.borderWidth = 1
        btnView.layer.borderColor = UIColor.black.cgColor

    }
        func registerCell(){
        let uinib = UINib(nibName: "SecondSubTableViewCell", bundle: nil)
        self.secondTableView.register(uinib, forCellReuseIdentifier: "SecondSubTableViewCell")
        secondTableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.showsVerticalScrollIndicator = false

    }
    
    @IBAction func viewBtnTapped(_ sender: Any) {
        //biewBtn.backgroundColor = UIColor(hex: "D0D9FB")
        
    }
    
    @IBAction func addBtnTapped(_ sender: Any) {
        //addBtn.backgroundColor = UIColor(hex: "D0D9FB")
    }
}
extension SecondTableViewCell : UITableViewDataSource{

   
    func numberOfSections(in tableView: UITableView) -> Int {
       return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = secondTableView.dequeueReusableCell(withIdentifier: "SecondSubTableViewCell", for: indexPath) as! SecondSubTableViewCell
        cell2.secondName.text = arr1[indexPath.row]
        cell2.secondImageView.image = UIImage(named: arr2[indexPath.row])
        cell2.selectionStyle = .none
        return cell2
    }
}
extension SecondTableViewCell : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
