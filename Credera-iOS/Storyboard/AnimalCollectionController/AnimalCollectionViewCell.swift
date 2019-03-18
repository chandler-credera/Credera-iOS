//
//  AnimalCollectionViewCell.swift
//  Credera-iOS
//
//  Created by Chandler Pergakis on 3/18/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
