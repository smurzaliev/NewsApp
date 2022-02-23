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
    public var bookmarkNewsImageURL: [String] = UserDefaults.standard.stringArray(forKey: "newsUrl") ?? []
    public var bookmarkNewsDescr: [String] = UserDefaults.standard.stringArray(forKey: "newsDescr") ?? []
    
    func saveNews(newsUrl: String, newsTitle: String, newsImageUrl: String, newsDescr: String) {
        bookmarkNewsUrl.insert(newsUrl, at: 0)
        userDefaults.set(bookmarkNewsUrl, forKey: "newsUrl")
        bookmarkNewsTitle.insert(newsTitle, at: 0)
        userDefaults.set(bookmarkNewsTitle, forKey: "newsTitle")
        bookmarkNewsImageURL.insert(newsImageUrl, at: 0)
        userDefaults.set(bookmarkNewsImageURL, forKey: "newsUrl")
        bookmarkNewsDescr.insert(newsDescr, at: 0)
        userDefaults.set(bookmarkNewsDescr, forKey: "newsDescr")
    }
    
    func clearBookmarks() {
        bookmarkNewsTitle.removeAll()
        bookmarkNewsUrl.removeAll()
        bookmarkNewsImageURL.removeAll()
        bookmarkNewsDescr.removeAll()
        userDefaults.set(bookmarkNewsUrl, forKey: "newsUrl")
        userDefaults.set(bookmarkNewsTitle, forKey: "newsTitle")
        userDefaults.set(bookmarkNewsImageURL, forKey: "newsUrl")
        userDefaults.set(bookmarkNewsDescr, forKey: "newsDescr")
    }
}
