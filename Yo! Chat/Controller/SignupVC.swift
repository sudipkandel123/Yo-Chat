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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //Variables
    var avatarName = "profileDefault" //default avatar imagename when nothing is selected
    var avatarColor = "[0.5,0.5,0.5,1]" //RBG alpha = 1
    var bgColor : UIColor? //optional to keep track of the bgselected or not
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        setUpView()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != ""
        {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            // Set the selected image to the imageview after the collection view gets disappeared
            avatarName = UserDataService.instance.avatarName //set the new value to the avatarName
            if avatarName.contains("light") && bgColor == nil //background color is empty and the color is light color
            {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any)
    {
        performSegue(withIdentifier: GO_TO_AVATAR_PICKER, sender: nil)
        
    }
    @IBAction func generateBColor(_ sender: Any)
    {
        
    let r = CGFloat(arc4random_uniform(255)) / 255
    let g = CGFloat(arc4random_uniform(255)) / 255
    let b = CGFloat(arc4random_uniform(255)) / 255
    
        bgColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r),\(g),\(b),1]"
        
        UIView.animate(withDuration: 0.2) //set animation when the background color is generated
        {
        self.userImage.backgroundColor = self.bgColor
        }
    
    }
    @IBAction func closeButtonPressed(_ sender: Any)
    {
        
        performSegue(withIdentifier: UNWIND, sender: nil)
    
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any)
    {
        
        spinner.isHidden = false
        spinner.startAnimating()
        guard let email = emailText.text , emailText.text != "" else {return}
        guard let name = usernameText.text , usernameText.text != "" else { return }
        guard let password = passwordText.text , passwordText.text != "" else{ return }
        //register the user
        AuthService.instance.registerUser(email: email, password: password)
        { (success) in
            if(success)
            {
                //login the user
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success
                    {
                        //create the userid
//                        print("Successfully Logged In",AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName:self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if(success)
                            {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
//                                print("User data \(UserDataService.instance.avatarName) , \(UserDataService.instance.name)")
                             self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
        
    }
    
    
    func setUpView()
    //changing the view of placeholder text etc
    {   spinner.isHidden = true
        usernameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor : placeHolderColor])
        emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : placeHolderColor])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : placeHolderColor])
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignupVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap()
    {
        view.endEditing(true)
    }
}
