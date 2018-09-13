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
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
//		loadCurrentUser()
	}
	
	//MARK: - IBActions
	
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
		
	}

	@IBAction func profileBtnAction(_ sender: Any) {
		performSegue(withIdentifier: "LoginVCSegue", sender: nil)
	}
	
	@objc func userDataDidChange(_ notif: Notification) {
		if AuthService.instance.isLoggedIn {
			userNameLbl.text = UserDataService.instance.name
			userIconImg.image = UIImage(named: UserDataService.instance.avatarName)
			userIconImg.backgroundColor = UserDataService.instance.returnUIColor()
		} else {
			userNameLbl.text = "Login"
			userIconImg.image = UIImage(named: "menuProfileIcon")
			userIconImg.backgroundColor = UIColor.clear
		}
	}
	
	
	
}
