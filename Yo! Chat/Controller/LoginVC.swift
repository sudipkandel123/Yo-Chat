//
//  LoginVC.swift
//  Yo! Chat
//
//  Created by Sudip on 12/6/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func closePressed(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func signupButtonPressed(_ sender: Any)
    {
        performSegue(withIdentifier: GO_TO_SIGNUP, sender: nil)
    }
    
}
