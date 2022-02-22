//
//  BookmarkCell.swift
//  NewsApp
//
//  Created by Samat Murzaliev on 22.02.2022.
//

import UIKit
import SnapKit

class BookmarkCell: UITableViewCell {
    
    var newsTitle: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    override func layoutSubviews() {
        setSubViews()
    }
    private func setSubViews() {
        addSubview(newsTitle)
        newsTitle.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.right.equalToSuperview().offset(-10)
        }
    }
}
