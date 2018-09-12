//
//  UIColor.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/11/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

extension UIColor {
	static var random: UIColor {
		let max = CGFloat(UInt32.max)
		let red = CGFloat(arc4random()) / max
		let green = CGFloat(arc4random()) / max
		let blue = CGFloat(arc4random()) / max
		
		return UIColor(red: red, green: green, blue: blue, alpha: 1)
	}
}
