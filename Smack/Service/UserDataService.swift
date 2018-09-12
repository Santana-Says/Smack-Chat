//
//  UserDataService.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/11/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation
import ObjectMapper

class UserDataService: Mappable {
	
	static let instance = UserDataService()
	
	private(set) var id = ""
	private(set) var email = ""
	private(set) var name = ""
	private(set) var avatarName = "menuProfileIcon"
	private(set) var avaterColor = ""
	
	init() {
		
	}
	
	required init?(map: Map) {
		
	}
	
	func mapping(map: Map) {
		id			<- map["_id"]
		email		<- map["email"]
		name		<- map["name"]
		avatarName	<- map["avatarName"]
		avaterColor	<- map["avatarColor"]
	}
	
//	func setUserData(id: String, email: String, name: String, avatarName: String, color: String) {
//		self.id = id
//		self.email = email
//		self.name = name
//		self.avatarName = avatarName
//		self.avaterColor = color
//	}
	
	func setAvatarName(avatar name: String) {
		avatarName = name
	}
	
	func resetUserData() {
		id = ""
		email = ""
		name = "Login"
		avatarName = "menuProfileIcon"
		avaterColor = ""
	}
}
