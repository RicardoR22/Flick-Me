//
//  StatusIndicatorView.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/23/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit


@available(iOS 13.0, *)
class StatusIndicatorView: UIView {
	
	
	init(frame: CGRect, message: String) {
		super.init(frame: frame)
		setupView()
		titleLabel.text = message
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupView() {
		backgroundColor = .clear
		setupSubViews()
		setViewConstraints()
	}
	
	func setupSubViews() {
		addSubview(holdingFrame)
		holdingFrame.addSubview(titleLabel)
		holdingFrame.addSubview(activityIndicator)
	}
	
	let holdingFrame: UIView = {
		let frame = UIView()
		frame.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
		frame.layer.cornerRadius = 10
		return frame
	}()
	
	
	
	let titleLabel: UITextView = {
		let label = UITextView()
		label.backgroundColor = .clear
		label.textColor = UIColor(named: "TextColor")
		label.font = UIFont.boldSystemFont(ofSize: 14)
		label.textAlignment = .center
		
		
		return label
	}()
	
	let activityIndicator: UIActivityIndicatorView = {
		let indicator = UIActivityIndicatorView()
		indicator.style = .large
		indicator.startAnimating()
		
		return indicator
	}()
	
	
}
