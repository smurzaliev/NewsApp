//
//  NewsBookmarkDocument.swift
//  NewsApp
//
//  Created by Samat Murzaliev on 22.02.2022.
//

import UIKit

class NewsBookmarkDocument {
    
    private var userDefaults = UserDefaults.standard
    public var bookmarkNewsTitle: [String] = UserDefaults.standard.stringArray(forKey: "newsTitle") ?? []
    public var bookmarkNewsUrl: [String] = UserDefaults.standard.stringArray(forKey: "newsUrl") ?? []
    
    func saveNews(newsUrl: String, newsTitle: String) {
        bookmarkNewsUrl.insert(newsUrl, at: 0)
        userDefaults.set(bookmarkNewsUrl, forKey: "newsUrl")
        bookmarkNewsTitle.insert(newsTitle, at: 0)
        userDefaults.set(bookmarkNewsTitle, forKey: "newsTitle")
    }
    
    func clearBookmarks() {
        bookmarkNewsTitle.removeAll()
        bookmarkNewsUrl.removeAll()
        userDefaults.set(bookmarkNewsUrl, forKey: "newsUrl")
        userDefaults.set(bookmarkNewsTitle, forKey: "newsTitle")
    }
}
