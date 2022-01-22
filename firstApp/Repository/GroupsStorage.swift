//
//  GroupsStorage.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import Foundation

class GroupsStorage {
    let userGroups: [GroupModel]
    let allGroups: [GroupModel]
    
    init(){
        userGroups = [
            GroupModel(name: "Rock music", imageName: CategoryGroup.music.rawValue, category: .music),
            GroupModel(name: "Nature", imageName: CategoryGroup.nature.rawValue, category: .nature),
            GroupModel(name: "Любители Звездных войн", imageName: CategoryGroup.film.rawValue, category: .film),
        ]
        
        allGroups = [
            GroupModel(name: "Classic film", imageName: CategoryGroup.film.rawValue, category: .film),
            GroupModel(name: "Classic music", imageName: CategoryGroup.music.rawValue, category: .film),
            GroupModel(name: "Western", imageName: CategoryGroup.film.rawValue, category: .film),
            GroupModel(name: "Punk", imageName: CategoryGroup.music.rawValue, category: .film),
            GroupModel(name: "For children film", imageName: CategoryGroup.film.rawValue, category: .film),
            GroupModel(name: "40 kg", imageName: CategoryGroup.other.rawValue, category: .other),
            GroupModel(name: "Nature", imageName: CategoryGroup.nature.rawValue, category: .nature),
            GroupModel(name: "Metal", imageName: CategoryGroup.music.rawValue, category: .music),
            GroupModel(name: "Story life", imageName: CategoryGroup.nature.rawValue, category: .nature),
            GroupModel(name: "Любители Звездных войн", imageName: CategoryGroup.film.rawValue, category: .film),
            GroupModel(name: "Other films", imageName: CategoryGroup.film.rawValue, category: .film)
        ]
    }
}
