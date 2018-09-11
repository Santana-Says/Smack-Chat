//
//  Constants.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/10/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ success: Bool) -> ()

//URL CONSTANTS
let BASE_URL = "https://smack-chating.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

//USER DEFAULTS

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
