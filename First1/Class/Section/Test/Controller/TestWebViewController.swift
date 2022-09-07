//
//  TestWebView.swift
//  First1
//
//  Created by New on 2022/8/12.
//

import UIKit
import WebKit

class TestWebViewController: UIViewController,WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero,configuration: webConfiguration)
        webView.uiDelegate = self
        
        view = webView
    }
    
    override func viewDidLoad() {
        
        let url = URL(string:"http://www.djy-es.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
