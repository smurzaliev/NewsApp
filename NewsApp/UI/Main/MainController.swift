//
//  ViewController.swift
//  NewsApp
//
//  Created by Samat Murzaliev on 19.02.2022.
//

import UIKit
import SnapKit

class MainController: UIViewController {
    
    private lazy var newsTable: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var searchField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.placeholder = "Search news"
        view.autocorrectionType = .no
        return view
    }()
    
    private lazy var searchButton: UIButton = {
        let view = UIButton()
        view.setTitle("Search", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .blue
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(clickSearch), for: .touchUpInside)
        return view
    }()
    
    private lazy var newsNumber: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = .gray
        view.textAlignment = .center
        return view
    }()
    
    private var models: NewsModel? = nil
    
    @objc func clickSearch(view: UIButton) {
        var topic = String()
        var error = true
        
        if searchField.text == nil {
            let alert = UIAlertController(title: "Error", message: "Enter news to search!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in }))
            present(alert,animated: true)
            error = true
        } else {
            topic = searchField.text ?? String()
            error = false
        }
        
        topic = topic.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if error == true {
            
            let alert = UIAlertController(title: "Error", message: "Bad search parameters. Try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in }))
            present(alert,animated: true)
            error = true
            
        } else {
            let url = URL(string: "https://newsapi.org/v2/everything?q=\(topic)&from=2022-01-23&sortBy=publishedAt&apiKey=430a142e68114f0dacd82264f44f34a9")
            
            URLSession.shared.dataTask(with: url!) { data, response, error in
                
                if let error = error {
                    print("json error")
                    print(error)
                } else {
                    self.models = try! JSONDecoder().decode(NewsModel.self, from: data!)
                    DispatchQueue.main.async {
                        self.newsNumber.text = "\(self.models?.articles?.count ?? 0) news articles found"
                        if self.models?.articles?.count == 0 {
                            let alert = UIAlertController(title: "Error", message: "No articles found!", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in }))
                            self.present(alert,animated: true)
                        }
                        self.newsTable.reloadData()
                    }
                }
            }.resume()
        }
    }
    
    @objc func clickBookmark() {
        navigationController?.pushViewController(NewsBookmarkController(), animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setSubViews()
    }
    
    private func setView() {
        title = "NewsApp"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Bookmarks", style: .plain, target: self, action: #selector(clickBookmark))
    }
    
    private func setSubViews() {
        
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(250)
            make.height.equalTo(30)
        }
        
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.right.equalToSuperview().offset(-10)
            make.left.equalTo(searchField.snp.right).offset(10)
            make.height.equalTo(30)
        }
        
        view.addSubview(newsNumber)
        newsNumber.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        view.addSubview(newsTable)
        newsTable.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(newsNumber.snp.bottom).offset(10)
        }
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsCell()
        let model = models?.articles?[indexPath.row]
        cell.fill(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = models?.articles?[indexPath.row].url
        let destVC = NewsDetailsController()
        destVC.url = url
        destVC.title1 = models?.articles?[indexPath.row].title
        destVC.url = models?.articles?[indexPath.row].url
        destVC.descr = models?.articles?[indexPath.row].articleDescription
        destVC.imageUrl = models?.articles?[indexPath.row].urlToImage
        navigationController?.pushViewController(destVC, animated: true)
    }
}
