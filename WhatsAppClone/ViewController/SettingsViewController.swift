//
//  SettingsViewController.swift
//  WhatsAppClone
//
//  Created by Marilise Morona on 04/08/22.
//

import UIKit

class SettingsViewController : UIViewController {
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ConfigTableViewCell.self, forCellReuseIdentifier: "ConfigTableViewCell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .red
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setUp()
        reloadTableView()
    }
    private func setUp() {
        view.addSubview(tableView)
        constraints()
        protocolsTableView()
    }
    private func constraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func protocolsTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    private func reloadTableView(){
        self.tableView.reloadData()
    }
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row: Int = 8
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConfigTableViewCell.identifier, for: indexPath) as? ConfigTableViewCell else { return UITableViewCell() }
        var model = ConfigModel(title: "Eu", image: "user01")
        cell.backgroundColor = .yellow
        cell.populate = model
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
