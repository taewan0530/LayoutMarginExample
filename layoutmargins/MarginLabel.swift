//
//  LMLabel.swift
//  layoutmargins
//
//  Created by taewan on 2017. 6. 18..
//  Copyright © 2017년 taewan. All rights reserved.
//
// 인터넷 검색!!
// https://stackoverflow.com/questions/3476646/uilabel-text-margin#answer-32785683

import UIKit

@IBDesignable
open class MarginLabel: UILabel {
    
    override open func drawText(in rect: CGRect) {
        var newRect: CGRect = rect
        newRect = UIEdgeInsetsInsetRect(rect, layoutMargins)
        super.drawText(in: newRect)
    }
    
    open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var newRect: CGRect = bounds
        newRect = UIEdgeInsetsInsetRect(bounds, layoutMargins.multiple(by: -1))
        return super.textRect(forBounds: newRect, limitedToNumberOfLines: numberOfLines)
    }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var adjSize = super.sizeThatFits(size)
        adjSize.width = adjSize.width + layoutMargins.left + layoutMargins.right
        adjSize.height = adjSize.height + layoutMargins.top + layoutMargins.bottom
        return adjSize
    }
    
    override open var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width = contentSize.width + layoutMargins.left + layoutMargins.right
        contentSize.height = contentSize.height + layoutMargins.top + layoutMargins.bottom
        return contentSize
    }
}


fileprivate extension UIEdgeInsets {
    func multiple(by value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: self.top * value,
                     left: self.left * value,
                     bottom: self.bottom * value,
                     right: self.right * value)
    }
}
