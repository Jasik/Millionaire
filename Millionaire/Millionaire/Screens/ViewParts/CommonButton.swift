//
//  CommonButton.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/02.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

final class CommonButton: UIButton {
    
    init(text: String, width: CGFloat = 200.0, height: CGFloat = 50.0, color: UIColor, radius: CGFloat = 12.0, textColor: UIColor = .black) {
        super.init(frame: .zero)
        
        setupContstraints(width, height)
        setupStyles(text, color: color, radius: radius, textColor: textColor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupContstraints(_ width: CGFloat, _ height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    private func setupStyles(_ text: String, color: UIColor, radius: CGFloat, textColor: UIColor) {
        backgroundColor = color
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
        layer.cornerRadius = radius
    }
    
}
