//
//  ChannelVC.swift
//  Yo! Chat
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeSWview()
        
    }
    //MARK: Customize the Swipe view as per required
    func customizeSWview(){
        //in this method the revealViewControllerwidth is set to the size of view frame's width -60
        // ie only except 60 points everything is revealed from the channel view controller
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-60
    }
}
