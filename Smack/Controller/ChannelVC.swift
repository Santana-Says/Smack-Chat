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

        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		loadCurrentUser()
	}
	
	//MARK: - IBActions
	
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
		
	}

	@IBAction func profileBtnAction(_ sender: Any) {
		performSegue(withIdentifier: "LoginVCSegue", sender: nil)
	}
	
	func loadCurrentUser() {
		userNameLbl.text = UserDataService.instance.name
		userIconImg.image = UIImage(named: UserDataService.instance.avatarName)
//		if let color: String = UserDataService.instance.avaterColor, color != "" {
//			userIconImg.backgroundColor = UIColor(red: color[0], green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
//		}
	}
	
}
