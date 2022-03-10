//
//  HomeVC.swift
//  HomeDecor
//
//  Created by Aglowid on 23/02/22.
//

import UIKit

class HomeVC: UIViewController {
//MARK: - outlet
    @IBOutlet weak var viewThemeBG: UIView!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var collectionDecor: UICollectionView!
    @IBOutlet weak var collectionItem: UICollectionView!
    @IBOutlet weak var collectionitemData: UICollectionView!
    
    var arrDecor : [DecorObject] = [DecorObject.initWithData(img: "Decor_img1"), DecorObject.initWithData(img: "Decor_img"), DecorObject.initWithData(img: "Decor_img1"), DecorObject.initWithData(img: "Decor_img2"), DecorObject.initWithData(img: "Decor_img1")]
    
    var arrItem:[String] = ["Chair", "Sofa", "Table"]
    
    var arrDetail : [DecorObject] = [DecorObject.initWithData(img: "Singlechair"), DecorObject.initWithData(img: "SofaChair"), DecorObject.initWithData(img: "SofaChair"), DecorObject.initWithData(img: "Singlechair"), DecorObject.initWithData(img: "SofaChair")]
    
    var selectedItem:Int = 0
    //MARK: -  view cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        collectionDecor.registerNib("DecorCCell")
        collectionItem.registerNib("itemCCell")
        collectionitemData.registerNib("DetailCCell")
    }
}


extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionDecor {
            return arrDecor.count
        } else if collectionView == collectionItem {
            return arrItem.count
        } else {
            return arrDetail.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionDecor {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DecorCCell", for: indexPath) as! DecorCCell
            return cell
        } else if collectionView == collectionItem {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCCell", for: indexPath) as! itemCCell
            cell.lblItemName.text = arrItem[indexPath.row]
            if selectedItem == indexPath.row {
                cell.viewBG.backgroundColor = UIColor(named: "AppThemeColor")
                cell.viewBG.layer.cornerRadius = 20
                cell.viewBG.layer.borderColor = UIColor(named: "AppThemeColor")?.cgColor
                cell.lblItemName.textColor = .white
            } else {
                cell.viewBG.backgroundColor = .white
                cell.viewBG.layer.cornerRadius = 20
                cell.viewBG.layer.borderColor = UIColor(named: "FontLightColor")?.cgColor
                cell.lblItemName.textColor = UIColor(named: "FontLightColor")
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCCell", for: indexPath) as! DetailCCell
            let obj = arrDetail[indexPath.row]
            cell.imgitem.image = UIImage(named: obj.img)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionItem {
            selectedItem = indexPath.row
            collectionView.reloadData()
        } else if collectionView == collectionitemData {
            let vc = DetailVC.instantiate(appStoryboard: .main)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionDecor {
            return CGSize(width: 170, height: 240)
        } else if collectionView == collectionItem {
            let label = UILabel(frame: CGRect.zero)
            label.text = arrItem[indexPath.row]
            label.sizeToFit()
            if label.width < 40 {
                return CGSize(width: 80, height: 50)
            }
            
            return CGSize(width: label.frame.size.width + 60, height: 50)
        } else {
            return CGSize(width: (collectionitemData.frame.size.width - 15) / 2, height: 250)
        }
        
        
    }
    
}
