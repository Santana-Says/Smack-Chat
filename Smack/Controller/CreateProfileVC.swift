//
//  CreateProfileVC.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/9/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class CreateProfileVC: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var usernameField: BetterPlaceholderTextField!
	@IBOutlet weak var emailField: BetterPlaceholderTextField!
	@IBOutlet weak var passwordField: BetterPlaceholderTextField!
	@IBOutlet weak var avatarIconImg: ProfileIconImage!
	@IBOutlet weak var loadingIndicator: LoadingSpinnerView!
	
	//MARK: - Variables
	
	var avatarName = "menuProfileIcon"
	var avatarColor = "[0.5, 0.5, 0.5, 1]"
	
	//MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
		view.addGestureRecognizer(tapGesture)
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let avatarVC = segue.destination as? AvatarVC {
			avatarVC.delegate = self
		}
	}
	
	//MARK: - IBActions

	@IBAction func closeBtnAction(_ sender: Any) {
		performSegue(withIdentifier: UNWIND, sender: nil)
	}
	
	@IBAction func chooseAvatarBtnAction(_ sender: Any) {
		performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
	}
	
	@IBAction func generateAvatarColorBtnAction(_ sender: Any) {
		let max = CGFloat(UInt32.max)
		let red = CGFloat(arc4random()) / max
		let green = CGFloat(arc4random()) / max
		let blue = CGFloat(arc4random()) / max
		
		avatarColor = "[\(red), \(green), \(blue), 1]"
		
		UIView.animate(withDuration: 0.2) {
			self.avatarIconImg.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
		}
	}
	
	@IBAction func createAccountBtnAction(_ sender: Any) {
		loadingIndicator.startAnimating()
		guard let name = usernameField.text, usernameField.text != "" else {return}
		guard let email = emailField.text, emailField.text != "" else {return}
		guard let pass = passwordField.text, passwordField.text != "" else {return}
		
		AuthService.instance.registerUser(email: email, password: pass) { (success) in
			if success {
				AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
					if success {
						AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
							if success {
								self.loadingIndicator.stopAnimating()
								NotificationCenter.default.post(name: NOTIF_USER_DID_CHANGE, object: nil)
								self.performSegue(withIdentifier: UNWIND, sender: nil)
							}
						})
					}
				})
			}
		}
	}
	
	//MARK: - Helpers
	
	@objc private func handleTap() {
		view.endEditing(true)
	}
}

extension CreateProfileVC: AvatarVCDelegate {
	func avatarVC(setAvatar imageName: String) {
		avatarIconImg.image = UIImage(named: imageName)
		avatarName = imageName
		
		if avatarName.contains("light") {
			avatarIconImg.backgroundColor = UIColor.lightGray
		}
	}
}



