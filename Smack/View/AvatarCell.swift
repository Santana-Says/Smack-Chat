//
//  AvatarCell.swift
//  Smack
//
//  Created by Jeffrey Santana on 9/9/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
	@IBOutlet weak var iconImg: UIImageView!
	
	override func awakeFromNib() {
		iconImg.layer.cornerRadius = 10
		iconImg.backgroundColor = UIColor.lightGray
	}
}
