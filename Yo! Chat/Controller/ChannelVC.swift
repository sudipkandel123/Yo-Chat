//
//  ChannelVC.swift
//  Yo! Chat
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    //for getting bacck from the signup to the channelvc
    @IBAction func prepareForUnWind(segue : UIStoryboardSegue){}
    
    @IBOutlet weak var userImage: CircleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeSWview()
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_CHANGE, object: nil)
        
    }
    //MARK: Customize the Swipe view as per required
    func customizeSWview(){
        //in this method the revealViewControllerwidth is set to the size of view frame's width -60
        // ie only except 60 points everything is revealed from the channel view controller
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-60
    }
    
    //Action
    @IBAction func loginButtonPressed(_ sender: Any)
    {
        performSegue(withIdentifier: GO_TO_LOGIN, sender: nil)
    }
    
    
    
    
    @objc func userDataDidChange(_ notif : Notification)
    { //check if we have loggedIn
        if AuthService.instance.isLoggedIn{
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(component: UserDataService.instance.avatarName)
        }
        else
        {
            loginBtn.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
        
        
    }
}
