//
//  BookmarkCell.swift
//  NewsApp
//
//  Created by Samat Murzaliev on 22.02.2022.
//

import UIKit
import SnapKit

class BookmarkCell: UITableViewCell {
    
    var newsImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var newsTitle: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    var newsDescr: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.textColor = .gray
        return view
    }()
        
    override func layoutSubviews() {
        addSubview(newsImage)
        newsImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(100)
        }
        
        addSubview(newsTitle)
        newsTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(newsImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        addSubview(newsDescr)
        newsDescr.snp.makeConstraints { make in
            make.top.equalTo(newsTitle.snp.bottom).offset(4)
            make.left.equalTo(newsImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
}
