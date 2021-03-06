//
//  Constants.swift
//  Yo! Chat
//
//  Created by Sudip on 12/6/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import Foundation
//segues  we use caps to denote constants
let GO_TO_LOGIN = "goToLogin"
let GO_TO_SIGNUP = "goToSignup"
let UNWIND = "goToChannelVC"
let GO_TO_AVATAR_PICKER = "goToAvatarPicker"


typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://yochat245.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login" //are stored in specific location in api
let URL_USER_ADD = "\(BASE_URL)user/add"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

//Colors
let placeHolderColor = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 1)

//Notification Constants
let NOTIF_USER_DATA_CHANGE = Notification.Name("notifUserDataChanged")
