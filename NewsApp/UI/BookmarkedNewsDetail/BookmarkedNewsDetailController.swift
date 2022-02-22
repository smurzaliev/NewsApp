//
//  BookmarkedNewsDetailController.swift
//  NewsApp
//
//  Created by Samat Murzaliev on 22.02.2022.
//

import UIKit
import SnapKit
import WebKit

class BookmarkedNewsDetailController: UIViewController {
    var url: String? = nil
    
    private lazy var webView: WKWebView = {
        return WKWebView()
    }()
    
    override func viewDidLoad() {
        setSubViews()
    }
    
    private func setSubViews() {

        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        webView.load(URLRequest(url: URL(string: url!)!))
    }
}
