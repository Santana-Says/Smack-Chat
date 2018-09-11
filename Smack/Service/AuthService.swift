//
//  AuthService.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/10/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class AuthService {
	static let instance = AuthService()
	
	let defaults = UserDefaults.standard
	
	private(set) var isLoggedIn: Bool {
		get {
			return defaults.bool(forKey: LOGGED_IN_KEY)
		}
		set {
			defaults.set(newValue, forKey: LOGGED_IN_KEY)
		}
	}
	
	private(set) var authToken: String {
		get {
			return defaults.value(forKey: TOKEN_KEY) as! String
		}
		set {
			defaults.set(newValue, forKey: TOKEN_KEY)
		}
	}
	
	private(set) var userEmail: String {
		get {
			return defaults.value(forKey: USER_EMAIL) as! String
		}
		set {
			defaults.set(newValue, forKey: USER_EMAIL)
		}
	}

	//MARK: - API REQUESTS
	
	func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
		let email = email.lowercased()
		let body: [String: Any] = [
			"email": email,
			"password": password
		]
		
		Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
			if response.result.error == nil {
				print("Successfully registered user!")
				completion(true)
			} else {
				print(response.result.error as Any)
				completion(false)
			}
		}
	}
	
	func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
		let email = email.lowercased()
		let body: [String: Any] = [
			"email": email,
			"password": password
		]
		
		Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseObject { (response: DataResponse<UserProfile>) in
			if let user = response.result.value {
				self.authToken = user.token
				self.userEmail = user.email
				self.isLoggedIn = true
				print("Successfully logged in user!")
				completion(true)
			} else {
				print(response.result.error as Any)
				completion(false)
			}
		}
	}
	
	func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
		let email = email.lowercased()
		let body: [String: Any] = [
			"email": email,
			"name": name,
			"avatarName": avatarName,
			"avatarColor": avatarColor
		]
		let header = [
			"Authorization": "Bearer \(AuthService.instance.authToken)",
			"Content-Type": "application/json; charset=utf-8"
		]
		
		Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseObject { (response: DataResponse<UserDataService>) in
			if let user = response.result.value {
				print("Fully created user!")
				print("Current user is \(user.name)")
				completion(true)
			} else {
				print(response.result.error as Any)
				completion(false)
			}
		}
	}
	
	
}
