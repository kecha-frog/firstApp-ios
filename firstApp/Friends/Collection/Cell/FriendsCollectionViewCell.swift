//
//  FriendsCollectionViewCell.swift
//  firstApp
//
//  Created by Ke4a on 23.01.2022.
//

import UIKit

protocol FriendsCollectionViewCellDelegate{
    func likeAction(_sender: Bool)
}

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
    var delegate: FriendsCollectionViewCellDelegate?
    
    func configure(_ image:ImageModel){
        imageOutlet.image = UIImage(named: image.name)
        likePhotoView.configure(image.like)
        likePhotoView.addTarget(self, action: #selector(likePhotoAction(_:)), for: .valueChanged)
    }

    @objc func likePhotoAction(_ sender:LikePhoto){
        print(sender)
        self.delegate?.likeAction(_sender: likePhotoView.like)
    }
}

