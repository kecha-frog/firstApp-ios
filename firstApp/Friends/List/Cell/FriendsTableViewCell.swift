//
//  FriendsTableViewCell.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet var imageFriendsOutlet: UIImageView!
    @IBOutlet var nameFriendsOutlet: UILabel!
    
    static var identifier = "FriendsTableViewCell"
    
    func configure(friend: FriendModel){
        nameFriendsOutlet.text = "\(friend.name) \(friend.surname)"
        imageFriendsOutlet.layer.cornerRadius = bounds.height / 2
        imageFriendsOutlet.image = UIImage(named: friend.imageUser.last!.name)
    }
}
