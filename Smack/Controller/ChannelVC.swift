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
	
	//MARK: - IBActions
	
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
		
	}

	@IBAction func profileBtnAction(_ sender: Any) {
		performSegue(withIdentifier: "LoginVCSegue", sender: nil)
	}
	
}
