//
//  FavoriteGroupsViewController.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import UIKit

class FavoriteGroupsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var dataFavoriteGroup: [GroupModel] = []
    let storage = GroupsStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataFavoriteGroup = storage.userGroups
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //добавление группы
    @IBAction func addGroup(unwindSegue: UIStoryboardSegue){
        guard let sourceController = unwindSegue.source as? AllGroupsViewController,
            let indexSellectCell = sourceController.tableView.indexPathForSelectedRow
        else { return }
        let group = sourceController.dataAllGroups[indexSellectCell.row]
        if !dataFavoriteGroup.contains(where: { group.name == $0.name }) {
            dataFavoriteGroup.append(group)
        }
    
        tableView.reloadData()
    }
    
    // Удаление группы
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            // Удаляем город из массива
            self.dataFavoriteGroup.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        action.backgroundColor = #colorLiteral(red: 1, green: 0.3464992942, blue: 0.4803417176, alpha: 1)
        action.image = UIImage(systemName: "trash.fill")
        return action
    }
}

extension FavoriteGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataFavoriteGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.identifier) as! GroupsTableViewCell
        cell.configure(group: dataFavoriteGroup[indexPath.row])
        return cell
    }
}
