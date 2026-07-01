//
//  LanguageListViewController.swift
//  LifeDemo
//
//  Created by Nozanin on 01/07/26.
//

import UIKit
//protocols data(2 methods) mandatory, behavior(optional)

class LanguageListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - views
    let tableView = UITableView() //container
    let data = [
        (UIImage(named: "taj_flag_icon"), "Точики", "TJ"),
        (UIImage(named: "russ_lang_icon"), "Русский", "RU"),
        (UIImage(named: "eng_lang_icon"), "English", "ENG"),
    ]
    
    // MARK: - private functions
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        //tell in advance which class to use to create one cell and under which label
        //.self to pass as argument and not create an object
        tableView.register(CustomLanguageCell.self, forCellReuseIdentifier: "cell")
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            //tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //inner label - how to refer to var inside func, Index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomLanguageCell
        let item = data[indexPath.row]
        cell.langIcon.image = item.0
        cell.langLabel.text = item.1
        cell.langSubLabel.text = item.2
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupTableView()
    }
}
