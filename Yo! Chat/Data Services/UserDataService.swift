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
    //function to set the avatar name ie update the avatar name later on
    func setAvatarName(avatarName : String)
    {
        self.avatarName = avatarName
    }
}
