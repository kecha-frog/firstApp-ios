//
//  AllGroupsViewController.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import UIKit

class AllGroupsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    // для данных из прошлого контролера
    var myGroupPreviousVC: [String] = []
    
    
    let storage = GroupsStorage()
    var dataAllGroups: [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // фильтруем чтоб были только уникальные значения
        dataAllGroups = storage.allGroups.filter { group in
            !myGroupPreviousVC.contains {$0 == group.name}
        }
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
