//
//  FriendsStorage.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import Foundation


class FriendsStorage{
    var friends:[FriendModel] = []
    init(){
        friends = [
            FriendModel(name: "Borat", surname: "Sagdiyev", imageName: .borat),
            FriendModel(name: "Ali", surname: "G", imageName: .aliG),
            FriendModel(name: "Aladdin", surname: "Dictator", imageName: .aladin),
            FriendModel(name: "Big", surname: "Boss", imageName: .bigBoss),
            FriendModel(name: "Bruno", surname: "Gehard", imageName: .bruno),
            FriendModel(name: "Herceg", surname: "Five", imageName: .herceg),
        ]
    }
}
