//
//  CircleImage.swift
//  Yo! Chat
//
//  Created by Sudip on 12/12/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit
@IBDesignable // to see result in the storyboard
class CircleImage: UIImageView {

    override func awakeFromNib() {
        setUpView()
    }
    func setUpView()
    {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
         super.prepareForInterfaceBuilder()
        setUpView()
    }

}
