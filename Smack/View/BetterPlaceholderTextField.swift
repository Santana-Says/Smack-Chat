//
//  BetterPlaceholderTextField.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/11/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

@IBDesignable
class BetterPlaceholderTextField: UITextField {
	@IBInspectable
	var placeHolderColor: UIColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.5)
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}
	
	override func prepareForInterfaceBuilder() {
		setupView()
	}
	
	func setupView() {
		if let placeholder = placeholder {
			attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
		}
	}
}
