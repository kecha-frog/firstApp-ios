//
//  FriendsViewController.swift
//  firstApp
//
//  Created by Ke4a on 22.01.2022.
//

import UIKit

class FriendsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let storage = FriendsStorage()
    var dataFriends:[FriendModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dataFriends = storage.friends
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // Удаление друзей
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.dataFriends.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        action.backgroundColor = #colorLiteral(red: 1, green: 0.3464992942, blue: 0.4803417176, alpha: 1)
        action.image = UIImage(systemName: "trash.fill")
        return action
    }
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier) as! FriendsTableViewCell
        cell.configure(friend: dataFriends[indexPath.row])
        return cell
    }
}
