//
//  LikePhoto.swift
//  firstApp
//
//  Created by Ke4a on 31.01.2022.
//

import UIKit

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
    
    var button: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "like")
        button.setImage(image, for: .normal)
        return button
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
        button.frame = bounds
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
        self.addSubview(button)
        self.addSubview(label)
        button.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
    }
    
    func configure(_ likeCount: Int, youLike:Bool){
        self.likeCount = likeCount
        self.youLike = youLike
        button.tintColor = youLike ? .red : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    @objc func likeAction(){
        self.youLike = !youLike!
        if !youLike! {
            button.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            likeCount -= 1
        }else if youLike!{
            button.tintColor = .red
            likeCount += 1
        }
    }
}
