//
//  NewsBookmarkController.swift
//  NewsApp
//
//  Created by Samat Murzaliev on 22.02.2022.
//

import UIKit
import SnapKit
import Kingfisher

class NewsBookmarkController: UIViewController {
    
    private var document = NewsBookmarkDocument()
    
    private lazy var bookmarkTable: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(BookmarkCell.self, forCellReuseIdentifier: "BookmarkCell")
        return view
    }()
    
    @objc func bookmarkClear(view: UIBarButtonItem) {
        document.clearBookmarks()
        bookmarkTable.reloadData()
    }
    
    override func viewDidLoad() {
        
        print(document.bookmarkNewsTitle)
        setView()
        setSubViews()
    }
    
    private func setView() {
        title = "Bookmarks"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear Bookmarks", style: .plain, target: self, action: #selector(bookmarkClear))
    }
    
    private func setSubViews() {
        view.addSubview(bookmarkTable)
        bookmarkTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension NewsBookmarkController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return document.bookmarkNewsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath) as! BookmarkCell
        cell.newsTitle.text = document.bookmarkNewsTitle[index]
        cell.newsDescr.text = document.bookmarkNewsDescr[index]
        cell.newsImage.kf.setImage(with: URL(string: document.bookmarkNewsImageURL[index]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = document.bookmarkNewsUrl[indexPath.row]
        let destVC = BookmarkedNewsDetailController()
        destVC.url = url
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
