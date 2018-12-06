//
//  GradientView.swift
//  Yo! Chat
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
// A class for the gradient construction for the background view
//this class is rendered inside the view of the channelvc

import UIKit
@IBDesignable //Interface Builder Designable lets the class know that the view is to rendered inside the storyboard
//lets work in storyboard
class GradientView: UIView
{
    //IBInspectable is used to change the value of story board ie customize according to requirement by passing the parameters
    @IBInspectable var topColor : UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1)  //UIColor.blue
    {
        didSet //set the below layout
        {
            self.setNeedsLayout() //invalidates the current layout of the receiver and trigger the layout update in next update cycle
        }
    }
    
    
    //for bottom gradient color
    @IBInspectable var bottomColor : UIColor =  #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1)         //UIColor.red
    {
        didSet
        {
            self.setNeedsLayout()
        }
    }
    //function inside UIview so we override it.
    override func layoutSubviews()
    {
        let gradientLayer = CAGradientLayer() //layout that draws color gradient over its background color
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor] //color is a array of type any which is expecting array of cgColor
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)// (0,0)       (1,0)  this coordinate shows the view.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) //  (0,1)       (1,1)
        gradientLayer.frame = self.bounds // view
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    
}
