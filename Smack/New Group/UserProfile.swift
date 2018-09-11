//
//  UserProfile.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/10/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserProfile: Mappable {
	private(set) var username = ""
	private(set) var email = ""
	private(set) var token = ""
	
	init?(map: Map) {
		
	}
	
	mutating func mapping(map: Map) {
		email		<- map["user"]
		token		<- map["token"]
	}
	
}
