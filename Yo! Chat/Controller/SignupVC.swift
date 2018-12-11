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
    //Outlets
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]" //RBG alpha = 1
    
    
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any)
    {
        
        
    }
    @IBAction func generateBColor(_ sender: Any)
    {
        
    
    
    }
    @IBAction func closeButtonPressed(_ sender: Any)
    {
        
        performSegue(withIdentifier: UNWIND, sender: nil)
    
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any)
    {
        
        guard let email = emailText.text , emailText.text != "" else {return}
        guard let name = usernameText.text , usernameText.text != "" else { return }
        guard let password = passwordText.text , passwordText.text != "" else{ return }
        //register the user
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if(success){
                //login the user
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        //create the userid
//                        print("Successfully Logged In",AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName:self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if(success)
                            {
                                print("User data \(UserDataService.instance.avatarName) , \(UserDataService.instance.name)")
                             self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
        
    }
    
}
