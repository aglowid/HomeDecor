//
//  Extension+TableView+collectionView.swift
//  TournamentApp
//
//  Created by Aglowid IT Solutions on 20/11/21.
//

import Foundation
import UIKit


extension UITableView {
    func registerNib(_ name: String, reuse: String = "") {
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: reuse == "" ? name : reuse)
    }
}


extension UICollectionView {
    func registerNib(_ name: String, reuse: String = "") {
        self.register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: reuse == "" ? name : reuse)
    }
    
    var visibleCurrentCellIndexPath: IndexPath? {
        for cell in self.visibleCells {
            let indexPath = self.indexPath(for: cell)
            return indexPath
        }
        
        return nil
    }
}
