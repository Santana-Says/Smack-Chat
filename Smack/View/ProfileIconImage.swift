//
//  ProfileIconImage.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/9/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileIconImage: UIImageView {
	
	override func awakeFromNib() {
		setupView()
	}
	
	override func prepareForInterfaceBuilder() {
		setupView()
	}
	
	func setupView() {
		layer.cornerRadius = layer.frame.width / 2
		layer.masksToBounds = true
	}

}
