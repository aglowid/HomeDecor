//
//  MirroringViewController.swift
//  tesing ms
//
//  Created by Moath_Othman on 1/27/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import UIKit
extension UIViewController {
    func loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: [UIView]) {
        if L102Language.currentAppleLanguage() == "ar" {
            if subviews.count != 100 {
                for subView in subviews {
                    if (subView is UIImageView) && subView.tag < 0 {
                        let toRightArrow = subView as! UIImageView
                        if let _img = toRightArrow.image {
                            toRightArrow.image = UIImage(cgImage: _img.cgImage!, scale:_img.scale , orientation: UIImage.Orientation.upMirrored)
                        }
                    }
                    if (subView is UIButton) && subviews.count != 100 {
                        let toRightArrow = subView as! UIButton
                        if let _img = toRightArrow.imageView?.image {
                            let image = UIImage(cgImage: _img.cgImage!, scale:_img.scale , orientation: UIImage.Orientation.upMirrored)
                            toRightArrow.setImage(image, for: .normal)
                        }
//                        toRightArrow.contentHorizontalAlignment = .right
                    }
                    loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: subView.subviews)
                }
            }
        }
    }
    
}
extension UIViewController {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if L102Language.currentAppleLanguage() == "ar" {
            loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: self.view.subviews)
        }
    }
}
