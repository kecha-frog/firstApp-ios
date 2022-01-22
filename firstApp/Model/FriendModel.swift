//
//  FriendModel.swift
//  firstApp
//
//  Created by Ke4a on 20.01.2022.
//

import Foundation
import UIKit

enum friendImageName:String{
    case aliG
    case borat
    case aladin
    case bigBoss
    case bruno
    case herceg
}

struct FriendModel{
    let name:String
    let surname:String
    let imageName:friendImageName
}
