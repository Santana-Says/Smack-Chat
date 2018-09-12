//
//  AvatarVC.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/9/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

protocol AvatarVCDelegate: class {
	func avatarVC(setAvatar imageName: String)
}

class AvatarVC: UIViewController {

	//MARK: - IBOutlets
	
	@IBOutlet weak var avatarCollection: UICollectionView!
	
	//MARK: - Variables
	
	private var avatarType = AvatarType.dark
	weak var delegate: AvatarVCDelegate?
	
	//MARK: - Life Cylce
	
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarCollection.dataSource = self
		avatarCollection.delegate = self
    }
	
	//MARK: - IBActions

	@IBAction func backBtnAction(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func switchBtnAction(_ sender: UISegmentedControl) {
		if sender.selectedSegmentIndex == 0 {
			avatarType = AvatarType.dark
		} else if sender.selectedSegmentIndex == 1 {
			avatarType = AvatarType.light
		}
		avatarCollection.reloadData()
	}
	
}

extension AvatarVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return AVATAR_COUNT
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = avatarCollection.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
			cell.config(index: indexPath.row, type: avatarType)
			return cell
		}
		return AvatarCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellSpace: CGFloat = 5
		let cellsPerRow: CGFloat = 4
		let sumOfSpaces = cellSpace * cellsPerRow
		let cellWidth = (avatarCollection.layer.frame.width - sumOfSpaces) / cellsPerRow
		
		return CGSize(width: cellWidth, height: cellWidth)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if avatarType == AvatarType.dark {
			delegate?.avatarVC(setAvatar: "dark\(indexPath.row)")
//			UserDataService.instance.setAvatarName(avatar: "dark\(indexPath.row)")
		} else if avatarType == AvatarType.light {
			delegate?.avatarVC(setAvatar: "light\(indexPath.row)")
//			UserDataService.instance.setAvatarName(avatar: "light\(indexPath.row)")
		}
		backBtnAction(self)
	}
	
}
