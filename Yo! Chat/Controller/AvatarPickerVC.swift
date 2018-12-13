//
//  AvatarPickerVC.swift
//  Yo! Chat
//
//  Created by Sudip on 12/11/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
   
    
    //Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Variable
    var avatarType = AvatarType.dark //from enum in AvatarCell.swift
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        

        
    }
    

    @IBAction func backPressed(_ sender: Any)
    {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlChanged(_ sender: Any)
    {
        if segmentControl.selectedSegmentIndex == 0{
        avatarType = .dark
       }
        else if segmentControl.selectedSegmentIndex == 1{
            avatarType = .light
        }
         collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var numberOfColumns : CGFloat = 3
        if UIScreen.main.bounds.width > 320 //greater than the size of iphone SE
        {
           numberOfColumns = 4
        }
        let spaceBetweenCells : CGFloat = 10 //space between the two collectioncell
        let padding : CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numberOfColumns - 1) * spaceBetweenCells) / numberOfColumns //to calculate the dimension of each collection cell
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark
        {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }
        else
        {
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
//        collectionView.reloadData()
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
}
