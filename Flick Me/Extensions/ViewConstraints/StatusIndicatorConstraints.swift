//
//  StatusIndicatorConstraints.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/23/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit


@available(iOS 13.0, *)
extension StatusIndicatorView {
    
    func setViewConstraints(){
        
        
        // Holding Frame Constraints
        
        holdingFrame.translatesAutoresizingMaskIntoConstraints = false
        holdingFrame.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        holdingFrame.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        holdingFrame.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        holdingFrame.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        
        // Title Label Constraints
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: holdingFrame.topAnchor, constant: 25).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: holdingFrame.centerXAnchor).isActive = true
		titleLabel.heightAnchor.constraint(equalTo: holdingFrame.heightAnchor, multiplier: 0.5).isActive = true
		titleLabel.widthAnchor.constraint(equalTo: holdingFrame.widthAnchor, multiplier: 0.8).isActive = true
        
        // Indicator Constraints
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: holdingFrame.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: holdingFrame.centerXAnchor).isActive = true
		
        
    }
}
