    //
    //  HighlightsViewController.swift
    //  18_Task
    //
    //  Created by Digitalflake Mahesh K on 21/03/24.
    //

import UIKit

class HighlightsViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var searchBtnh: UIButton!
    @IBOutlet weak var accountBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        firstView.layer.cornerRadius = self.firstView.frame.height/2
        accountBtn.layer.cornerRadius = self.accountBtn.frame.height/2
        
    }
    func registerCell(){
        let uinib = UINib(nibName: "FirstTableViewCell", bundle: nil)
        self.mainTableView.register(uinib, forCellReuseIdentifier: "FirstTableViewCell")
        
        let uinib2 = UINib(nibName: "SecondTableViewCell", bundle: nil)
        self.mainTableView.register(uinib2, forCellReuseIdentifier: "SecondTableViewCell")
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.showsVerticalScrollIndicator = false
        
    }
    
    @IBAction func accountBtnTapped(_ sender: Any) {
        let popUpVC = self.storyboard?.instantiateViewController(identifier: "PopUpViewController") as! PopUpViewController
        popUpVC.modalPresentationStyle = .overCurrentContext
        popUpVC.modalTransitionStyle = .crossDissolve
        
        self.present(popUpVC, animated: true)
    }
    
}
extension HighlightsViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return  setUpHeaderView(atableview: tableView, forSection: section)
    }
    
    @objc func addButtonAction(){
        
    }
    @objc func optionsButtonAction(){
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if section == 1{
            return 1
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell1 = mainTableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as! FirstTableViewCell
                //cell1.backgroundColor = .red
            return cell1
        }
        if indexPath.section == 1{
            let cell2 = mainTableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
                //            cell2.backgroundColor = .clear
                //            cell2.contentView.backgroundColor = .clear
            return cell2
        }else {
            return UITableViewCell()
        }
    }
    func setUpHeaderView(atableview : UITableView,forSection : Int)-> UIView{
        let headerView = UIView()
        let firstLbel = UILabel()
        let secondBtn = UIButton()
        
        secondBtn.setTitleColor(.black, for: .normal)
        firstLbel.translatesAutoresizingMaskIntoConstraints = false
        secondBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
            //headerView.backgroundColor = .lightGray
        headerView.addSubview(firstLbel)
        headerView.addSubview(secondBtn)
        
        if forSection == 0{
            firstLbel.text = "Favorites"
            secondBtn.setTitle("Add", for: .normal)
            
                // secondBtn.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        }
        if forSection == 1{
            firstLbel.text = "Recent"
            secondBtn.setImage(UIImage(named: "icons8-menu-vertical-30"), for: .normal)
                // secondBtn.addTarget(self, action: #selector(optionsButtonAction), for: .touchUpInside)
        }
        
        NSLayoutConstraint.activate([
            firstLbel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            firstLbel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0),
            firstLbel.widthAnchor.constraint(equalToConstant: 160),
            
            secondBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            //secondBtn.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0),
            secondBtn.widthAnchor.constraint(equalToConstant: 100)
        ])
            //headerView.backgroundColor = .green
        
        return headerView
    }

    
    
}
extension HighlightsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            let numOfItem = 5
            let width = (Int(self.view.frame.width) - 20)/numOfItem
            if numOfItem == 5{
                return (CGFloat(width)+50.0)*2
            }
            return CGFloat(width)+50.0
        }
        if indexPath.section == 1{
            let numOfItem = 6
            return CGFloat(60*numOfItem)
        }else {
            return 0
        }
    }
}

