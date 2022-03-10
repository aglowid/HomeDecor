//
//  DetailVC.swift
//  HomeDecor
//
//  Created by Aglowid on 23/02/22.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var collectionColor: UICollectionView!
    
    var arrColor:[String] = ["44655E", "3F12B3", "D89412", "000000", "888888"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionColor.registerNib("ColorCCell")
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}


extension DetailVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCCell", for: indexPath) as! ColorCCell
        let obj = arrColor[indexPath.row]
        cell.viewColor.backgroundColor = UIColor(hexString: obj)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
}
