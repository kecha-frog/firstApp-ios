//
//  AllGroupsViewController.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import UIKit

class AllGroupsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let storage = GroupsStorage()
    var dataAllGroups: [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataAllGroups = storage.allGroups
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AllGroupsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataAllGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.identifier) as! GroupsTableViewCell
        cell.configure(group:dataAllGroups[indexPath.row])
        return cell
    }
}
