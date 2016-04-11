//
//  ViewController.swift
//  Swiftbox
//
//  Created by PATRICK PERINI on 4/11/16.
//  Copyright © 2016 pcperini. All rights reserved.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {
    // MARK: Properties
    @IBInspectable var initialURL: String = ""
    @IBOutlet var webView: UIWebView!
    
    // MARK: Lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: self.initialURL)!
        self.webView.loadRequest(NSURLRequest(URL: url))
    }
}

