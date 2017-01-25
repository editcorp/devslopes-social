//
//  CircleView.swift
//  devslopes-social
//
//  Created by Michael L Gueterman on 1/25/17.
//  Copyright © 2017 Michael L Gueterman. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = self.frame.width / 2
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        layer.cornerRadius = self.frame.width / 2
//    }
}
