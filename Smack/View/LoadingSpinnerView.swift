//
//  LoadingSpinnerView.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/11/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

@IBDesignable
class LoadingSpinnerView: UIActivityIndicatorView {

	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupView()
	}
	
	override func prepareForInterfaceBuilder() {
		setupView()
	}
	
	func setupView() {
		backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0.7470569349)
		color = #colorLiteral(red: 0.2039215686, green: 0.3803921569, blue: 0.7137254902, alpha: 1)
		layer.cornerRadius = 10
		clipsToBounds = true
		activityIndicatorViewStyle = .whiteLarge
		hidesWhenStopped = true
	}

}
