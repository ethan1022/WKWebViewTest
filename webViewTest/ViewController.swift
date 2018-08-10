//
//  ViewController.swift
//  webViewTest
//
//  Created by Ethan on 2018/8/10.
//  Copyright © 2018年 H2. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.navigationDelegate = self
        let url = URL(string: "http://www.lingala.net/zip4j/download.php")
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == WKNavigationType.linkActivated {
            print("link")
            decisionHandler(.allow) // allow or cancel action
            return
        }
        print("no link")
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // get header and print it
        if let response = navigationResponse.response as? HTTPURLResponse {
            let header = response.allHeaderFields
            print(header)
        }
        decisionHandler(.allow)
    }

 /*
    More detail can see...
     
     https://www.jianshu.com/p/d29384454a9a
     https://stackoverflow.com/questions/34547161/downloading-files-wkwebview-ios
     
 */
}

