//
//  AvatarVC.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/9/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class AvatarVC: UIViewController {

	//MARK: - IBOutlets
	
	@IBOutlet weak var avatarCollection: UICollectionView!
	
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
	
	@IBAction func switchBtnAction(_ sender: Any) {
	}
	
}

extension AvatarVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 27
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = avatarCollection.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
			cell.iconImg.image = #imageLiteral(resourceName: "dark11")
			return cell
		}
		return AvatarCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellSpace: CGFloat = 5
		let cellsPerRow: CGFloat = 4
		let cellWidth = (avatarCollection.layer.frame.width - (cellSpace * cellsPerRow)) / cellsPerRow
		
		return CGSize(width: cellWidth, height: cellWidth)
	}
	
}
