//
//  ChannelVC.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/9/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var userIconImg: ProfileIconImage!
	@IBOutlet weak var userNameLbl: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIF_USER_DID_CHANGE, object: nil)
		checkForUser()
    }
	
	//MARK: - IBActions
	
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
		
	}

	@IBAction func profileBtnAction(_ sender: Any) {
		if AuthService.instance.isLoggedIn {
			performSegue(withIdentifier: TO_PROFILE, sender: nil)
		} else {
			performSegue(withIdentifier: TO_LOGIN, sender: nil)
		}
	}
	
	@objc func userDataDidChange(_ notif: Notification) {
		checkForUser()
	}
	
	func checkForUser() {
		if AuthService.instance.isLoggedIn {
			userNameLbl.text = UserDataService.instance.name
			userIconImg.image = UIImage(named: UserDataService.instance.avatarName)
			userIconImg.backgroundColor = UserDataService.instance.getBackgroundColor()
		} else {
			userNameLbl.text = "Login"
			userIconImg.image = UIImage(named: "menuProfileIcon")
			userIconImg.backgroundColor = UIColor.clear
		}
	}
	
}
