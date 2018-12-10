//
//  AuthService.swift
//  //  Yo! Chat
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    
    static let instance = AuthService() // instance of authService a singleton
    
    let defaults = UserDefaults.standard //to store the credentials
    
    var isLoggedIn : Bool //to check if a particular user is logged in or not
    {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String //token for validation of the pass
    {
        get {
            
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String //email validation
    {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) //function for registering user where completion is to check the status whether the api is fetched properly or not
    {
        
        let lowerCaseEmail = email.lowercased() //only lowercased email is valid for now
        
        
        //passes the email and the pass into the mlab for authentication
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        //a url request from the constant to store the account and pass post method from the alamofire pod , params is the body , encoding is JSONEncoding.default// in a closure if the error is nil then return true and if error print in the console
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString
            { (response) in
                
                if response.result.error == nil
                {
                    completion(true)
                } else
                {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
    }
    
    func loginUser(email : String , password : String , completion : @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        let body : [String : Any ] =
        [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString
        { (response) in
            if response.result.error == nil
            {
                if let json = response.result.value as? Dictionary<String,Any>
                {
                    if let email = json["user"] as? String
                    {
                        self.userEmail = email //from the AuthService
                    }
                    if let token = json["token"] as? String {
                        self.authToken = token //from the AuthService
                    }
                }
                //once it is successfull then
                self.isLoggedIn = true //from the AuthService
                completion(true)
            }
            else
            {
             completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
