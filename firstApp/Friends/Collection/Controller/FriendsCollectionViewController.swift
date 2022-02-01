//
//  FriendsCollectionViewController.swift
//  firstApp
//
//  Created by Ke4a on 23.01.2022.
//

import UIKit

class FriendsCollectionViewController: UIViewController {
    var dataUserImage:[ImageModel] = []
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension FriendsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataUserImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsCollectionViewCell.identifier, for: indexPath) as! FriendsCollectionViewCell
        cell.configure(dataUserImage[indexPath.item])
        return cell
    }
}
