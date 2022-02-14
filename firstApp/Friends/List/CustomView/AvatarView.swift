//
//  AvatarView.swift
//  firstApp
//
//  Created by Ke4a on 31.01.2022.
//

import UIKit

// MARK: 1
@IBDesignable class AvatarView: UIView {
    // MARK: 2
    @IBInspectable var radius: CGFloat = 3 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var color: UIColor = UIColor.gray {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var opacity: CGFloat = 0.5 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.2624342442, green: 0.4746298194, blue: 0.7327683568, alpha: 1)
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Float(opacity)
        
        
        imageView.clipsToBounds = true
    
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.frame = bounds
        
        let radius = frame.size.width / 2
        self.layer.cornerRadius = radius
        imageView.layer.cornerRadius = radius
    }
    
    func setImage(_ imageName: String){
        self.imageView.image = UIImage(named: imageName)
    }
}
