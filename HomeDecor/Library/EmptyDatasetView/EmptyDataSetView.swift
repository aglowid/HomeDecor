//
//  EmptyDataSetView.swift
//  TournamentApp
//
//  Created by Aglowid on 30/11/21.
//

import Foundation
import UIKit

class EmptyDataSetView : UIView {
    
    
    // MARK: - variable declaration
    @IBOutlet var viewEmptyData: UIView!
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var stackBG: UIStackView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDis: UILabel!
    
    
    // MARK: - functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit(){
        
        Bundle.main.loadNibNamed("EmptyDataSetView", owner: self, options: nil)
        addSubview(viewEmptyData)
        viewEmptyData.frame = self.bounds
        viewEmptyData.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        lblTitle.text = "No Data Found"
    }
    
    func setData(title:String,dis:String) {
        lblTitle.text = title
        lblDis.text = dis
    }
    
    
}
