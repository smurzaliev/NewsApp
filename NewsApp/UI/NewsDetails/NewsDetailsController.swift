//
//  NewsDetailsController.swift
//  NewsApp
//
//  Created by Samat Murzaliev on 22.02.2022.
//

import UIKit
import SnapKit
import WebKit

class NewsDetailsController: UIViewController {
    
    private var document = NewsBookmarkDocument()
    var url: String? = nil
    var title1: String? = nil
    private lazy var webView: WKWebView = {
        return WKWebView()
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Add to Bookmark", for: .normal)
        view.addTarget(self, action: #selector(bookmarkAdd), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        setView()
        setSubViews()
    }
    
    private func setView() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Bookmark", style: .plain, target: self, action: #selector(bookmarkAdd))
    }
    
    @objc func bookmarkAdd() {
        document.saveNews(newsUrl: url!, newsTitle: title1!)
        let alert = UIAlertController(title: "Success!", message: "Bookmark added. Go to Bookmarks page to see.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in }))
        present(alert,animated: true)
    }
    
    private func setSubViews() {
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.right.bottom.equalToSuperview()
        }
        webView.load(URLRequest(url: URL(string: url!)!))
    }
}
