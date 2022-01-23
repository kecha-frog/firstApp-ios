//
//  FriendModel.swift
//  firstApp
//
//  Created by Ke4a on 20.01.2022.
//

import Foundation
import UIKit



struct ImageModel{
    let name:String
    var like: Int
}

struct FriendModel{
    let name:String
    let surname:String
    let imageUser: [ImageModel]
}
