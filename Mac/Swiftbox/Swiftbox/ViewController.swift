//
//  ViewController.swift
//  Swiftbox
//
//  Created by PATRICK PERINI on 4/11/16.
//  Copyright © 2016 pcperini. All rights reserved.
//

import Cocoa
import WebKit

@IBDesignable
class ViewController: NSViewController {
    // MARK: Properties
    @IBInspectable var initialURL: String = ""
    @IBOutlet var webView: WebView!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.mainFrameURL = self.initialURL
    }
}

internal extension NSView {
    // MARK: Constraint Improvements
    func setEqualAttributes(attribute: NSLayoutAttribute, toView view: NSView) {
        self.addConstraint(NSLayoutConstraint(item: view,
            attribute: attribute,
            relatedBy: .Equal,
            toItem: self,
            attribute: attribute,
            multiplier: 1.0,
            constant: 0.0))
    }
}
