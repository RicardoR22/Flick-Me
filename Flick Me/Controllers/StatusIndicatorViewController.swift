//
//  StatusIndicatorViewController.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/23/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit


@available(iOS 13.0, *)
class StatusIndicatorViewController: UIViewController {
    var statusView: StatusIndicatorView!
	var message: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: View setup
    
    func setup() {
        setupView()
    }
    
    
    
    func setupView() {
		let mainView = StatusIndicatorView(frame: self.view.frame, message: self.message)
        self.statusView = mainView
        self.view.addSubview(statusView)
        
    }
	
	@objc func dismissAlert() {
		self.dismiss(animated: true)
	}
}
