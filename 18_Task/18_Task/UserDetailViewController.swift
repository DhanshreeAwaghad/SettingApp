//
//  UserDetailViewController.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 28/03/24.
//

import UIKit

class UserDetailViewController: UIViewController,ConnectionManagerDelegate{
  
    @IBOutlet weak var userDetailTableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userLastNnameLbl: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!

    @IBOutlet weak var textBtn: UIButton!
    @IBOutlet weak var callBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var contactInfoView: UIView!
    
    var receiveUserId : String?
    private var manager = ConnectionManager()
    var userDetail : UserDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        if let receiveUserId = receiveUserId{
            callAPI(withId: "/" + receiveUserId)
        }
        else{
            print("Did not found userId")
        }
        setUpUserDetailScreenUI()
        userDetailTableView.dataSource = self
        userDetailTableView.delegate = self
    }
    
    func registerCell(){
        let uinib = UINib(nibName: "UserDetailTableViewCell", bundle: nil)
        userDetailTableView.register(uinib, forCellReuseIdentifier: "UserDetailTableViewCell")
    }
    
    private func setUpUserDetailScreenUI(){
        self.navigationController?.navigationBar.isHidden = false
        contactInfoView.layer.cornerRadius = 20
        callBtn.layer.cornerRadius = callBtn.frame.height/2
        textBtn.layer.cornerRadius = textBtn.frame.height/2
        videoBtn.layer.cornerRadius = videoBtn.frame.height/2
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        
        
        callBtn.backgroundColor = UIColor(hex: "D0D9FB", alpha: 1)
        textBtn.backgroundColor = UIColor(hex: "D0D9FB", alpha: 1)
        videoBtn.backgroundColor = UIColor(hex: "D0D9FB", alpha: 1)
    }

    func callAPI(withId : String){
        manager.delegate = self
        manager.prepareForSession(endpoint: .user,queryStr:withId)
    }
    func didFinishTask(data: Data?, error: Error?) {
        guard error == nil else { return }
        print("Error  -----> \(error)")
        
        guard let data = data else { return }
        do{
            
            userDetail = try JSONDecoder().decode(UserDetailModel.self, from: data)
            print("data : -\(userDetail)")
            
        }
        catch{
            print("Error : -\(error)")
        }
        DispatchQueue.main.async {
            let imgURL = self.userDetail?.picture
            if let imgURL = imgURL{
                ImageDownloader.downloadImage(imgURL) { image, urlString, error in
                    self.userImageView.image = image
                }
            }
            else{
                self.userImageView.image = UIImage(systemName: "Globe")
            }
            self.userNameLabel.text = self.userDetail?.firstName
            self.phoneLabel.text = self.userDetail?.phone
            self.userLastNnameLbl.text = self.userDetail?.lastName
            self.userDetailTableView.reloadData()
        }
    }
}
extension UserDetailViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contact Settings"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userDetailTableView.dequeueReusableCell(withIdentifier: "UserDetailTableViewCell", for: indexPath) as! UserDetailTableViewCell
        return cell
    }
    
    
}
extension UserDetailViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158
    }
}
