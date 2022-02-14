//
//  LikePhoto.swift
//  firstApp
//
//  Created by Ke4a on 31.01.2022.
//

import UIKit
// MARK: 3
class LikePhoto: UIControl {
//    var youLike: Bool? {
//        didSet {
//            self.sendActions(for: .valueChanged)
//        }
//    }
    
    var youLike: Bool?
    var likeCount: Int = 0{
        didSet{
            label.text = String(likeCount)
        }
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "like")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var label: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        text.textColor = .white
        text.textAlignment = .center
        return text
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        label.frame = bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
    }
    
    func setupUI(){
        self.addSubview(imageView)
        self.addSubview(label)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configure(_ likeCount: Int, youLike:Bool){
        self.likeCount = likeCount
        self.youLike = youLike
        imageView.tintColor = youLike ? .red : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    @objc func likeAction(){
        self.youLike = !youLike!
        if !youLike! {
            imageView.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            likeCount -= 1
        }else if youLike!{
            imageView.tintColor = .red
            likeCount += 1
        }
    }
}
