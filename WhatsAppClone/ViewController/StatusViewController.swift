//
//  StatusViewController.swift
//  WhatsAppClone
//
//  Created by Marilise Morona on 15/10/21.
//

import UIKit

struct Model {
    var title: String
    var subtitle: String
    var hour: String
    var numb: String
}

class StatusViewController : UIViewController{

    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StatusTableViewCell.self, forCellReuseIdentifier: "StatusTableViewCell")
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
extension StatusViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var header: String?
        switch section{
        case 0:
            header = ""
            return header
        case 1:
            header = "RECENT UPDATES"
            return header
        case 2:
            header = "VIEWED UPDATES"
            return header
        default:
            break
        }
        return header
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
        case 2:
            row = 4
            return row
        default:
            break
        }
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatusTableViewCell.identifier, for: indexPath) as? StatusTableViewCell else { return UITableViewCell() }
        var model = Model(title: "Eu", subtitle: "Eu mesmo", hour: "22:09", numb: "22")
        cell.backgroundColor = .yellow
        cell.populate = model
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
