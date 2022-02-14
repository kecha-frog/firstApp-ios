//
//  FriendsTableViewCell.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet var avatarView: AvatarView!
    @IBOutlet var nameFriendsOutlet: UILabel!
    
    static var identifier = "FriendsTableViewCell"

    
    func configure(friend: FriendModel){
        nameFriendsOutlet.text = "\(friend.name) \(friend.surname)"
        avatarView.setImage(friend.avatar.name)
        self.layoutIfNeeded()
    }
}
