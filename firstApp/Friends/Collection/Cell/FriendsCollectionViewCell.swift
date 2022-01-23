//
//  FriendsCollectionViewCell.swift
//  firstApp
//
//  Created by Ke4a on 23.01.2022.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageOutlet: UIImageView!
    
    static let identifier = "FriendsCollectionViewCell"
    
    func configure(_ image:ImageModel){
        imageOutlet.image = UIImage(named: image.name)
    }
}
