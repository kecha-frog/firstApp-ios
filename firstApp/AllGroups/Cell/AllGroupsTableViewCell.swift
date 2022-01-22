//
//  AllGroupsTableViewCell.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {
    @IBOutlet var nameGroupCellOutlet: UILabel!
    @IBOutlet var imageCellOutlet: UIImageView!
    
    static let identifier = "AllGroupsTableViewCell"

    func configure(group:GroupModel){
        nameGroupCellOutlet.text = group.name
        imageCellOutlet.image = UIImage(named: group.imageName)
    }
}
