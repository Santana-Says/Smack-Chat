//
//  LoginVC.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/9/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var userNameField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	
	//MARK: - Life Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	deinit {
		print("Removed LoginVC")
	}

	//MARK: - IBActions
	
	@IBAction func loginBtnAction(_ sender: Any) {
	}
	
	@IBAction func signUpBtnAction(_ sender: Any) {
		performSegue(withIdentifier: "CreateProfileVCSegue", sender: nil)
	}
	
	@IBAction func closeBtnAction(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
}
