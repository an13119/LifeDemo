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
    let label : UILabel = {
        let label = UILabel()
        label.text = "Язык приложения"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        //.self to pass as argument while not creating an object
        tableView.register(CustomLanguageCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 2),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
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
        view.addSubview(label)
        view.addSubview(tableView)
        setupTableView()
        constraints()
    }
}
