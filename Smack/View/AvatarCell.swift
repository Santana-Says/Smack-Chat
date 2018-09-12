//
//  AvatarCell.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/9/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

enum AvatarType {
	case dark
	case light
}

class AvatarCell: UICollectionViewCell {
    
	@IBOutlet weak var iconImg: UIImageView!
	
	override func awakeFromNib() {
		iconImg.layer.cornerRadius = 10
	}
	
	func config(index: Int, type: AvatarType) {
		if type == AvatarType.dark {
			iconImg.image = UIImage(named: "dark\(index)")
			iconImg.backgroundColor = UIColor.lightGray
		} else if type == AvatarType.light {
			iconImg.image = UIImage(named: "light\(index)")
			iconImg.backgroundColor = UIColor.gray
		}
	}
}
