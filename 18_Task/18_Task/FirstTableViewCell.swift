//
//  FirstTableViewCell.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 21/03/24.
//

import UIKit

class FirstTableViewCell: UITableViewCell,UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource {
    
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    var arr1 : [String] = ["Aboli","Apeksha","Chameli","Dhanashree","Dipti"]
    var arr2 = ["a1","a2","a3","a4","a5"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        firstCollectionView.dataSource = self
        firstCollectionView.delegate = self
        
        let width = (self.contentView.frame.size.width - 20)/5
        let layout = firstCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width+20)
            //self.layoutSubviews()
        self.layoutIfNeeded()
    }
    func registerCell(){
        let uinib = UINib(nibName: "FirstSubCollectionViewCell", bundle: nil)
        self.firstCollectionView.register(uinib, forCellWithReuseIdentifier: "FirstSubCollectionViewCell")
        firstCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "FirstSubCollectionViewCell", for: indexPath) as! FirstSubCollectionViewCell
        collectionCell.firstName.text = arr1[indexPath.row]
        collectionCell.firstImageView.image = UIImage(named: arr2[indexPath.row])
        return collectionCell
    }
   
}
