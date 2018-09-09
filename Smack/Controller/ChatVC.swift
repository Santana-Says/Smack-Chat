//
//  ChatVC.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/4/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit
import SideMenu

class ChatVC: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupSideMenu()
	}

	@IBAction func menuBtnAction(_ sender: Any) {
		present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
	}
	
	func setupSideMenu() {
		let menuLeftNavController = storyboard?.instantiateViewController(withIdentifier: "SideMenu") as! LeftSideMenuNavController
		SideMenuManager.default.menuLeftNavigationController = menuLeftNavController
		SideMenuManager.default.menuAddPanGestureToPresent(toView: view)
		SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: view)
	}

}

