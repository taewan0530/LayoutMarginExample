//
//  ExampleView.swift
//  layoutmargins
//
//  Created by taewan on 2017. 6. 18..
//  Copyright © 2017년 taewan. All rights reserved.
//

import UIKit

@IBDesignable
class ExampleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        preservesSuperviewLayoutMargins = true
        let view = loadNib()
        
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings: [String: Any] = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[view]-|", options: [], metrics: nil, views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|", options: [], metrics: nil, views: bindings))
    }
}


extension ExampleView {
    fileprivate func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
    
    fileprivate func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName(), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    }
}
