//
//  GroupTableViewCell.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import UIKit

final class FavoriteGroupTableViewCell: UITableViewCell {
    @IBOutlet var nameGroupOutlet: UILabel!
    @IBOutlet var imageNameGroupOutlet: UIImageView!
    
    static let identifier = "FavoriteGroupTableViewCell"
    
    func configure(group: GroupModel){
        nameGroupOutlet.text = group.name
        imageNameGroupOutlet.image = UIImage(named: group.imageName)
    }
}
