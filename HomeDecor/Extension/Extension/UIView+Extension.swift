//
//  UIView+Extension.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 31/01/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func copyView<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
    
    
    func makeCircle()
    {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.height/2;
    }
    func viewWithCornerAndShadow(corners: UIRectCorner, radius: CGFloat, shadowOpacity:Float = 0.3, shadowRadius:CGFloat = 3) {
        
        let shadowLayer = CAShapeLayer()
        
        shadowLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        shadowLayer.fillColor = UIColor.clear.cgColor//fillColor.cgColor
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 3
        self.layer.sublayers?.filter{ $0 is CAShapeLayer }.forEach{ $0.removeFromSuperlayer() }
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    
    func bottomViewShadow(corners: UIRectCorner, radius: CGFloat, shadowOpacity:Float = 0.3, shadowRadius:CGFloat = 3) {
        let shadowLayer = CAShapeLayer()
        
        shadowLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        shadowLayer.fillColor = self.backgroundColor?.cgColor
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 5
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    
    func dropShadow(offset:CGSize = CGSize(width: 0.0, height: 0.0)) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 2.3
    }
    
    func setGradientBackground(color1:UIColor, color2:UIColor) {
        let colorTop =  color1.cgColor
        let colorBottom = color2.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    var parentController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    
    func takeScreenshot() -> UIImage {

        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
    
    var width:CGFloat {
        return self.frame.size.width
    }
    
    var height:CGFloat {
        return self.frame.size.height
    }

    var xPos:CGFloat {
        return self.frame.origin.x
    }

    var yPos:CGFloat {
        return self.frame.origin.y
    }

    var heightBy2:CGFloat {
        return self.frame.size.height / 2
    }
    
    var widthBy2:CGFloat {
        return self.frame.size.width / 2
    }
   
    
}


extension UIButton {
    func cellSelected (btn:UIButton) {
        let selectedColor  : UIColor = UIColor(named: "appColor")!
        self.backgroundColor = selectedColor
        self.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
    }
}


extension UITextField {
    func setPdding() {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}


