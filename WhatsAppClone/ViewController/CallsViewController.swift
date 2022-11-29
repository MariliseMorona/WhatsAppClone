//
//  CallsViewController.swift
//  WhatsAppClone
//
//  Created by Marilise Morona on 04/08/22.
//

import UIKit

class CallsViewController : UIViewController {
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CallTableViewCell.self, forCellReuseIdentifier: "CallTableViewCell")
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
extension CallsViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row: Int = 0
        switch section{
        case 0:
            row = 1
            return row
        case 1:
            row = 3
            return row
        default:
            break
        }
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CallTableViewCell.identifier, for: indexPath) as? CallTableViewCell else { return UITableViewCell() }
        var model = CallModel(title: "Eu", status: "Efetuada", date: "22/09/1990", image: "user01")
        cell.backgroundColor = .yellow
        cell.populate = model
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
