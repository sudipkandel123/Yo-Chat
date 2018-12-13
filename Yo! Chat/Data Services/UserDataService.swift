//
//  UserDataService.swift
//  Yo! Chat
//
//  Created by Sudip on 12/11/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import Foundation
class UserDataService {
    static let instance = UserDataService() //singleton
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    //function to set the user data 
    func setUserData(id : String , color : String , avatarName : String , email : String ,name : String)
    {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
    }
    //function to set the avatar name ie update the avatar name later on the imageview
    func setAvatarName(avatarName : String)
    {
        self.avatarName = avatarName
    }
    
    func returnUIColor(component : String) -> UIColor
    {
        
        let scanner = Scanner(string: component) //scan the string data
        let skipped = CharacterSet(charactersIn: "[], ]") //exclude three parts [], and space
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        var r,b,g,a : NSString?
       
        scanner.scanUpToCharacters(from: comma, into: &r) //scan upto , and in r var
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &a)
        let defaultColor = UIColor.gray //incase we fail
        //guard statement to unwrap each of the statement above
        guard let rUnwrapped = r else { return defaultColor}
        guard let bUnwrapped = b else { return defaultColor}
        guard let gUnwrapped = g else { return defaultColor}
        guard let aUnwrapped = a else { return defaultColor}
        //no direct way of converting cgFloat to the String so we use float and then convert the float to the int
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        return newUIColor
    }
    
    
    
}
