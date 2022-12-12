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
        
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        let url = URL(string:"https://mall.95516.com/newmobile/page/detail/7351?channel=3")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
