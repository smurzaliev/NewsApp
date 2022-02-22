//
//  NewsCell.swift
//  NewsApp
//
//  Created by Samat Murzaliev on 22.02.2022.
//

import UIKit
import SnapKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    private lazy var newsImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var newsTitle: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    private lazy var newsDescr: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.textColor = .gray
        return view
    }()
    
    private var modelArticle: Article?
    
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
    func fill(model: Article?) {
        modelArticle = model
        newsTitle.text = model?.title
        newsDescr.text = model?.articleDescription
        if let url = model!.urlToImage {
            if let urlSS = URL(string: url) {
                newsImage.kf.setImage(with: urlSS)
            }
        }
    }
}
