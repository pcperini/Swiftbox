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
    
    private static var cssInjectionScript: String! = {
        guard let cssInjectionFilePath = NSBundle.mainBundle().pathForResource("Injection", ofType: "css"),
        let rawCSSInjection = try? NSString(contentsOfFile: cssInjectionFilePath, encoding: NSUTF8StringEncoding) else {
            return nil
        }
        
        let cssInjection = rawCSSInjection.stringByReplacingOccurrencesOfString("\n", withString: " ")
        let injectionScript: String = (
            "var css = document.createElement('style');" +
            "css.innerHTML = '\(cssInjection)';" +
            
            "var head = document.getElementsByTagName('head')[0];" +
            "head.appendChild(css);"
        )
        
        return injectionScript
    }()
    
    // MARK: Lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: self.initialURL)!
        self.webView.loadRequest(NSURLRequest(URL: url))
    }
}

extension ViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(webView: UIWebView) {
        self.webView.stringByEvaluatingJavaScriptFromString(ViewController.cssInjectionScript)
    }
}

