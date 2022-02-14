//
//  FriendsCollectionViewCell.swift
//  firstApp
//
//  Created by Ke4a on 23.01.2022.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageOutlet: UIImageView!
    @IBOutlet var likePhotoView: LikePhoto!
    static let identifier = "FriendsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configure(_ image:ImageModel){
        imageOutlet.image = UIImage(named: image.name)
        likePhotoView.configure(image.like, youLike: image.youLike)
        //likePhotoView.addTarget(self, action: #selector(likePhotoAction(_:)), for: .valueChanged)
    }

//    @objc func likePhotoAction(_ sender:LikePhoto){
//        guard let like = likePhotoView.youLike else {
//            return
//        }
//        print(like)
//    }
}

