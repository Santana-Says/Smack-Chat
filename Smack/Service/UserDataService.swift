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
	private(set) var avatarName = ""
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
	
	func setUserData(id: String, email: String, name: String, avatarName: String, color: String) {
		self.id = id
		self.email = email
		self.name = name
		self.avatarName = avatarName
		self.avaterColor = color
	}
	
	func setAvatar(name: String, color: String) {
		avatarName = name
		avaterColor = color
	}
	
	func returnUIColor() -> UIColor {
		let scanner = Scanner(string: avaterColor)
		let skipped = CharacterSet(charactersIn: "[], ]")
		let comma = CharacterSet(charactersIn: ",")
		scanner.charactersToBeSkipped = skipped
		
		var r, g, b, a: NSString?
		
		scanner.scanUpToCharacters(from: comma, into: &r)
		scanner.scanUpToCharacters(from: comma, into: &g)
		scanner.scanUpToCharacters(from: comma, into: &b)
		scanner.scanUpToCharacters(from: comma, into: &a)
		
		let defaultColor = UIColor.lightGray
		
		guard let rUnwrapped = r else {return defaultColor}
		guard let gUnwrapped = r else {return defaultColor}
		guard let bUnwrapped = r else {return defaultColor}
		guard let aUnwrapped = r else {return defaultColor}
		
		let rFloat = CGFloat(rUnwrapped.doubleValue)
		let gFloat = CGFloat(gUnwrapped.doubleValue)
		let bFloat = CGFloat(bUnwrapped.doubleValue)
		let aFloat = CGFloat(aUnwrapped.doubleValue)
		
		return UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)		
	}
	
}












