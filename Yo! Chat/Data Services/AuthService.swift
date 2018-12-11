//
//  AuthService.swift
//  //  Yo! Chat
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
                //USING REGULAR APPROACH
                
                //Using Swifty JSON
                guard let data = response.data else{ return }
                let json = try! JSON(data: data) //force unwrapping can also be safely unwrapped
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
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
    
    
    
    func createUser(name : String , email : String , avatarName : String , avatarColor : String , completion : @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        let body : [String:Any] =
        [
            "name" : name,
            "email" : lowerCaseEmail,
            "avatarName" : avatarName,
            "avatarColor" : avatarColor
        ]
        
        let header =
        [
            "Authorization" : "Bearer \(AuthService.instance.authToken)" ,
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil
            {
                guard let data = response.data else {return}
                let json = try! JSON(data: data)
                completion(true)
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
            }
            else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    
    
    
}
