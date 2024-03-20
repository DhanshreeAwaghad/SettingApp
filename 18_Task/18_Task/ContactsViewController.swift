//
//  ContactsViewController.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 18/03/24.
//

import UIKit


class PopupView: UIView {
        // Customize your popup view here
}

class ContactsViewController: UIViewController, UIViewControllerTransitioningDelegate{
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var contactCollectionView: UICollectionView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var userDetailButton: UIButton!
    @IBOutlet weak var contactNmTableView: UITableView!
    @IBOutlet weak var menuButton: UIButton!
    
    let menuView = UIView()
    
    @IBOutlet weak var plusFloatingBtn: UIButton!
    
    var popupView: PopupView!
    
    var isComingFromSideMenu : Bool?
    
    var names : [String] =
    ["Akansha","Apeksha","Aarvi","Aaradhya","Aboli","Aachal","Bhavika","Balika","Bittu","Chameli","Chanda","Dhanashree","Dipti","Dipali","Divya"]
    
    var img : [String] = ["a1","a2","a3","a4","a5","a6","a1","a2","a3","a4","a5","a6","a1","a2","a3"]
    
    var image : [String] = ["phone","envelope","building.2"]
    
    var data : [String] = ["Phone contacts","Email contacts","Company"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        plusFloatingBtn.layer.cornerRadius = 15
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false  // if u tap on view it wont cancel
        self.view.addGestureRecognizer(tapGestureRecognizer)//It wont disappear
        self.menuView.isHidden = true
        self.view.addSubview(menuView)
        self.setUpMenUIView()
        
        menuView.backgroundColor = UIColor(hex: "D8F0F7")
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOffset = CGSize(width: -1, height: 1)
        menuView.layer.shadowOpacity = 0.5
        userDetailButton.layer.cornerRadius = self.userDetailButton.frame.height/2
        firstView.layer.cornerRadius = self.firstView.frame.height/2
        emailLbl.text = "dhanashreeawaghad07@gmail.com"
        contactCollectionView.dataSource = self
        contactCollectionView.delegate = self
        contactNmTableView.dataSource = self
        contactNmTableView.delegate = self
        contactCollectionView.showsHorizontalScrollIndicator = false
        contactCollectionView.showsVerticalScrollIndicator = false
        
        popupView = PopupView()
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: 200),
            popupView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
            // Initially hide the popup view
        popupView.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("IS Comming from SideMenuVC : \(isComingFromSideMenu)")
        if let isComingFromSideMenu = isComingFromSideMenu{
            let sideVC = self.storyboard?.instantiateViewController(identifier: "CreateLabelViewController") as! CreateLabelViewController
            sideVC.modalPresentationStyle = .overCurrentContext
            sideVC.modalTransitionStyle = .crossDissolve
            self.present(sideVC, animated: true)
        }
        else {
            print("Nothing to show")
        }
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(isPresentation: true)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(isPresentation: false)
    }
    
    func registerCell(){
        let uinib = UINib(nibName: "ContactCollectionViewCell", bundle: nil)
        self.contactCollectionView.register(uinib, forCellWithReuseIdentifier: "ContactCollectionViewCell")
        
        let nib2 = UINib(nibName: "ContactNmTableViewCell", bundle: nil)
        self.contactNmTableView.register(nib2, forCellReuseIdentifier: "ContactNmTableViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 160, height: 36.0)
    }
    func setUpMenUIView(){
        
        let menuStackView = UIStackView()
        menuStackView.axis = .vertical
        menuStackView.alignment = .leading
        menuStackView.spacing = 10.0
        menuStackView.distribution = .fillEqually
        
        let firstBtn = UIButton()
        let secondBtn = UIButton()
        let thirdBtn = UIButton()
        
        menuStackView.addArrangedSubview(firstBtn)
        menuStackView.addArrangedSubview(secondBtn)
        menuStackView.addArrangedSubview(thirdBtn)
        
        firstBtn.setTitle("Select", for: .normal)
        secondBtn.setTitle("Select all", for: .normal)
        thirdBtn.setTitle("Customize view", for: .normal)
        
        firstBtn.setTitleColor(UIColor.black, for: .normal)
        secondBtn.setTitleColor(UIColor.black, for: .normal)
        thirdBtn.setTitleColor(UIColor.black, for: .normal)
        
        firstBtn.titleLabel?.font = UIFont(name: "Helvetica-Medium", size: 20.0)
        secondBtn.titleLabel?.font = UIFont(name: "Helvetica-Medium", size: 20.0)
        thirdBtn.titleLabel?.font = UIFont(name: "Helvetica-Medium", size: 20.0)
        
        firstBtn.addTarget(self, action: #selector(menuAction1), for: .touchUpInside)
        secondBtn.addTarget(self, action: #selector(menuAction2), for: .touchUpInside)
        thirdBtn.addTarget(self, action: #selector(menuAction3), for: .touchUpInside)
        
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.menuView.addSubview(menuStackView)
        
        NSLayoutConstraint.activate([
            
            menuView.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor,constant: 40),
            menuView.topAnchor.constraint(equalTo: menuButton.topAnchor,constant: 0),
            menuView.widthAnchor.constraint(equalToConstant: 200),
            menuView.heightAnchor.constraint(equalToConstant: 150),
            
            menuStackView.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 10),
            menuStackView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 10),
            menuStackView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -10),
            menuStackView.bottomAnchor.constraint(equalTo: menuView.bottomAnchor, constant: -10)
        ])
    }
    
    
    @IBAction func accountBtnClicked(_ sender: UIButton) {
        let popUpVC = self.storyboard?.instantiateViewController(identifier: "PopUpViewController") as! PopUpViewController
        popUpVC.modalPresentationStyle = .overCurrentContext
        popUpVC.modalTransitionStyle = .crossDissolve
        
        self.present(popUpVC, animated: true)
        
    }
    
    @IBAction func menuBtnAction(_ sender: UIButton) {
            //  sender.isSelected = !sender.isSelected
        if sender.isSelected{
            self.menuView.isHidden = true
        }else {
            self.menuView.isHidden = false
        }
        
    }
    
    @IBAction func sideMenuBtnAction(_ sender: Any) {
        let sideVC = self.storyboard?.instantiateViewController(identifier: "SideMenuViewController") as! SideMenuViewController
        sideVC.modalPresentationStyle = .overCurrentContext
        //sideVC.modalTransitionStyle = .crossDissolve
        self.present(sideVC, animated: true)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: menuView)
            //        sender.numberOfTapsRequired = 1
        if !menuView.bounds.contains(location) {
            self.menuView.isHidden = true
        }
        else{
            self.menuView.isHidden = false
        }
    }
    
    @objc func menuAction1(){
        
    }
    @objc func menuAction2(){
        
    }
    @objc func menuAction3(){
        
    }
    
}
extension ContactsViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.contactCollectionView.dequeueReusableCell(withReuseIdentifier: "ContactCollectionViewCell", for: indexPath) as! ContactCollectionViewCell
        cell.imgLabel.image = UIImage(systemName: image[indexPath.row])
        //cell.imgLabel.image = UIImage(named: image[indexPath.row])
        cell.dataLabel.text = data[indexPath.row]
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
}
extension ContactsViewController : UICollectionViewDelegateFlowLayout{

}
extension ContactsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = self.contactNmTableView.dequeueReusableCell(withIdentifier: "ContactNmTableViewCell", for: indexPath) as! ContactNmTableViewCell
        cell1.contactNm.text = names[indexPath.row]
        cell1.contactIImg.image = UIImage(named: img[indexPath.row])
        return cell1
    }
    
    
}
extension ContactsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        63.0
    }
}

