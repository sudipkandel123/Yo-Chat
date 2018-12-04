//
//  ChatVC.swift
//  Yo! Chat
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//also we used SWRevealViewController and customized it.
// For every method a comment is written above the functionality.

import UIKit

class ChatVC: UIViewController {
    //Outlet
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rearSwipe()

    }
    
    //MARK : Function to perform rear swipe
    func rearSwipe(){
        
        //this method is for triggering an action which implement rear swipe action which helps in revealing the channel view controller and the functionalities are implemented from the SWRevealViewController and revealToggle is the method init
        //this method is similar to the action added from the button
       
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        // The following method will provide a panGestureRecognizer suitable to be added to any view
        // in order to perform usual drag and swipe gestures to reveal the rear views. This is usually added to the top bar
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }
    

   
}
