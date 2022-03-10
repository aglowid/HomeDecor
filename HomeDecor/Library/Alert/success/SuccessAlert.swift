//
//  SuccessAlert.swift
//  TournamentApp
//
//  Created by Aglowid IT Solutions on 20/11/21.
//

import UIKit



class SuccessAlert: UIView {

    //MARK: - outlet
    @IBOutlet var viewSuccessAlert: UIView!
    @IBOutlet weak var btnViewHide: UIButton!
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var stackMain: UIStackView!
    @IBOutlet weak var btnArchive: UIButton!
    @IBOutlet weak var btnMove: UIButton!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnToday: UIButton!
    
    //MARK: - cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("SuccessAlert", owner: self, options: nil)
        addSubview(viewSuccessAlert)
        viewSuccessAlert.frame = self.bounds
        viewSuccessAlert.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.viewBG.roundCorners(corners: .allCorners, radius: self.viewBG.heightBy2)
//            self.viewBG.shadowRadius = 10
//            self.viewBG.shadowColor = .lightGray
//            self.viewBG.shadowOpacity = 0.3
//            self.viewBG.shadowOffset = CGSize(width: -5 , height: 5)
//        }
    }
    
    //MARK: - func dataSet
    func setData(title:String, Dis:String) {
//        lblTitle.text = title
//        lblSubTitle.text = Dis
    }
  
    //MARK: - btn click
    //MARK: btn view hide
    var btnViewHideClick : (() -> ()) = {}
    @IBAction func btnViewHideClick(_ sender: Any) {
        btnViewHideClick()
    }
    
    //MARK: btnArchive
    var btnArchiveClick : (() -> ()) = {}
    @IBAction func btnArchiveClick(_ sender: Any) {
        btnArchiveClick()
    }
    
    //MARK: btnMove
    var btnMoveClick : (() -> ()) = {}
    @IBAction func btnMoveClick(_ sender: Any) {
        btnMoveClick()
    }
    
    //MARK: btn Menu
    var btnMenuClick : (() -> ()) = {}
    @IBAction func btnMenuClick(_ sender: Any) {
        btnMenuClick()
    }
    
    //MARK: btnToday
    var btnTodayClick : (() -> ()) = {}
    @IBAction func btnTodayClick(_ sender: Any) {
        btnTodayClick()
    }
    
}

