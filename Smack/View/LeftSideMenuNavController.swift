//
//  LeftSideMenuNavController.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/5/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation
import SideMenu

class LeftSideMenuNavController: UISideMenuNavigationController {
	let customSideMenuManager = SideMenuManager.default
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupSideMenu()
		sideMenuManager = customSideMenuManager
	}
	
	func setupSideMenu() {
		customSideMenuManager.menuWidth = view.frame.size.width - 60
		customSideMenuManager.menuPresentMode = .viewSlideInOut
		customSideMenuManager.menuAnimationBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
	}
}
