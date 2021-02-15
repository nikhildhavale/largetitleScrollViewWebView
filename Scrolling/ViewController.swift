//
//  ViewController.swift
//  Scrolling
//
//  Created by Nikhil Vivek Dhavale on 15/02/21.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        // Do any additional setup after loading the view.
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        webView.navigationDelegate = self
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
    }
}
