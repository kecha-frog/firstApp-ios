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
        imageFriendsOutlet.image = UIImage(named: friend.avatar.name)
        imageFriendsOutlet.layer.cornerRadius = imageFriendsOutlet.frame.size.width / 2
        imageFriendsOutlet.contentMode = .scaleAspectFit
        imageFriendsOutlet.clipsToBounds = true
        imageFriendsOutlet.layer.borderWidth = 2.0
        imageFriendsOutlet.layer.borderColor = #colorLiteral(red: 0.2624342442, green: 0.4746298194, blue: 0.7327683568, alpha: 1).cgColor
        self.layoutIfNeeded()
    }
}
