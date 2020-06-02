//
//  CommonButton.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/02.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

final class CommonButton: UIButton {
    
    init(text: String, width: CGFloat = 90.0, height: CGFloat = 30.0, color: UIColor, radius: CGFloat = 8.0) {
        super.init(frame: .zero)
        
        setupContstraints(width, height)
        setupStyles(text, color, radius)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupContstraints(_ width: CGFloat, _ height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    private func setupStyles(_ text: String, _ color: UIColor, _ radius: CGFloat) {
        backgroundColor = color
        setTitle(text, for: .normal)
        layer.cornerRadius = radius
    }
    
}
