//
//  ViewController.swift
//  Scrolling
//
//  Created by Nikhil Vivek Dhavale on 15/02/21.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://m.timesofindia.com")!))
        // Do any additional setup after loading the view.
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        webView.navigationDelegate = self
        webView.scrollView.isScrollEnabled = false
    }
    @objc func refresh()
    {
        webView.reload()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
extension ViewController:WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        scrollView.refreshControl?.endRefreshing()
        webView.evaluateJavaScript("document.body.scrollHeight", completionHandler: { [weak self] (result, error) in
                       if let height = result as? CGFloat {
                        self?.heightConstraint.constant = height
                       }
        })
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        scrollView.refreshControl?.endRefreshing()
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        scrollView.refreshControl?.endRefreshing()

    }
}
