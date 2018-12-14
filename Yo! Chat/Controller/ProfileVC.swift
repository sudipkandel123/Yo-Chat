//
//  ProfileVC.swift
//  Yo! Chat
//
//  Created by Sudip on 12/14/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        //to clear everything notification is used
        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView()
    {
        nameLabel.text = UserDataService.instance.name
        emailLabel.text = UserDataService.instance.email
        profileImageView.image = UIImage(named: UserDataService.instance.avatarName)
        profileImageView.backgroundColor = UserDataService.instance.returnUIColor(component: UserDataService.instance.avatarColor)
        //when we tap in the background the view dismiss automatically
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        bgView.addGestureRecognizer(TapGesture)
    }
    @objc func tapGesture(_ recognizer : UITapGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
}
