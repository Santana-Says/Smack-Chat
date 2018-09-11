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
	
	@IBOutlet weak var usernameField: UITextField!
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	
	//MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	//MARK: - IBActions

	@IBAction func closeBtnAction(_ sender: Any) {
		performSegue(withIdentifier: "unwindToChannelVC", sender: nil)
	}
	
	@IBAction func chooseAvatarBtnAction(_ sender: Any) {
		performSegue(withIdentifier: "AvatarVCSegue", sender: nil)
	}
	
	@IBAction func generateAvatarColorBtnAction(_ sender: Any) {
	}
	
	@IBAction func createAccountBtnAction(_ sender: Any) {
		guard let email = emailField.text, emailField.text != "" else {return}
		guard let pass = passwordField.text, passwordField.text != "" else {return}
		
		AuthService.instance.registerUser(email: email, password: pass) { (success) in
			if success {
				print("Successfully registered user!")
			}
		}
	}
}
