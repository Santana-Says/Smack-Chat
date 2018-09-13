//
//  ProfileVC.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/12/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
	
	//MARK:: - IBOutlets
	
	@IBOutlet weak var profileIconImg: ProfileIconImage!
	@IBOutlet weak var usernameLbl: UILabel!
	@IBOutlet weak var emailLbl: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
	
	//MARK: - IBActions
	
	@IBAction func closeBtnAction(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func logoutBtnAction(_ sender: Any) {
		UserDataService.instance.logoutUser()
		NotificationCenter.default.post(name: NOTIF_USER_DID_CHANGE, object: nil)
		dismiss(animated: true, completion: nil)
	}
	
	func setupView() {
		usernameLbl.text = UserDataService.instance.name
		emailLbl.text = UserDataService.instance.email
		profileIconImg.image = UIImage(named: UserDataService.instance.avatarName)
		profileIconImg.backgroundColor = UserDataService.instance.getBackgroundColor()
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(tapOut(_:)))
		view.addGestureRecognizer(tap)
	}
	
	@objc private func tapOut(_ recognizer: UITapGestureRecognizer) {
		dismiss(animated: true, completion: nil)
	}
}
