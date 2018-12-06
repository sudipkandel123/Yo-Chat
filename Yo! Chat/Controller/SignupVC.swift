//
//  SignupVC.swift
//  Yo! Chat
//
//  Created by Sudip on 12/6/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit

class SignupVC: UIViewController
{
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any)
    {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
