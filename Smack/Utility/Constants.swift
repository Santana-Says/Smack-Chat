//
//  Constants.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/10/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ success: Bool) -> ()

//SEGUES

let TO_LOGIN = "LoginVCSegue"
let TO_CREATE_PROFILE = "CreateProfileVCSegue"
let UNWIND = "unwindToChannelVC"
let TO_AVATAR_PICKER = "AvatarVCSegue"
let TO_PROFILE = "ProfileVCSegue"

//URL CONSTANTS

let BASE_URL = "https://smack-chating.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//USER DEFAULTS

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//HEADERS

let HEADER = ["Content-Type": "application/json; charset=utf-8"]

//NOTIFICATIONS

let NOTIF_USER_DID_CHANGE = Notification.Name("notifUserDataChanged")

//RANDOM

let AVATAR_COUNT = 28

