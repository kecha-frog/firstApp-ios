//
//  GroupModel.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import Foundation

enum CategoryGroup:String{
    case music
    case film
    case nature
    case other
}

struct GroupModel{
    let name:String
    let imageName:String
    let category: CategoryGroup
}
