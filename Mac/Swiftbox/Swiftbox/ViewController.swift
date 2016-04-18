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
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.mainFrameURL = self.initialURL
    }
}

extension ViewController: WebFrameLoadDelegate {
    func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
        sender.stringByEvaluatingJavaScriptFromString(ViewController.cssInjectionScript)
    }
}
