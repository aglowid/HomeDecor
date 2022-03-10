//
//  SuccessAlert.swift
//  TournamentApp
//
//  Created by Aglowid IT Solutions on 20/11/21.
//

import UIKit



class LogoutAlert: UIView {
    
    var tournamentID:Int = 0
    var isForLogout:Bool = false
    
    @IBOutlet var logoutAlert: UIView!
    
    @IBOutlet weak var viewDesc: UIView!
    @IBOutlet weak var imgCheck: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var btnAgreed: UIButton!
    
    @IBOutlet weak var stckViewBtn: UIStackView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnAlertHide: UIButton!
    /*
   
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    // MARK: -
    func commonInit(){
        
        Bundle.main.loadNibNamed("LogoutAlert", owner: self, options: nil)
        addSubview(logoutAlert)
        logoutAlert.frame = self.bounds
        logoutAlert.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        print(lblSubTitle.height)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.stckViewBtn.roundCorners(corners: .allCorners, radius: self.stckViewBtn.heightBy2)
            self.btnCancel.roundCorners(corners: .allCorners, radius: self.btnCancel.heightBy2)
            self.btnLogout.roundCorners(corners: .allCorners, radius: self.btnLogout.heightBy2)
        }
    }
    
    func setDataForSkip(title:String, Dis:String,  btnSkip:String, btnNAme:String) {
        lblTitle.text = title
        if isForLogout == true {
            viewDesc.isHidden = true
            lblTitle.text = Dis
        }
        lblSubTitle.text = Dis
        btnLogout.setTitle(btnNAme, for: .normal)
        btnCancel.setTitle(btnSkip, for: .normal)
    }
 
    
    var btnCancelClick:(() -> ()) = {}
    @IBAction func btnCancelClick(_ sender: Any) {
        btnCancelClick()
       
    }
    
    var btnLogoutClick:(() -> ()) = {}
    @IBAction func btnLogoutClick(_ sender: Any) {
//        if isForLogout == true {
//            self.btnLogoutClick()
//        } else {
//            if AppUtil().getUserToken() == "" {
//                self.btnLogoutClick()
//            } else {
//                if btnAgreed.isSelected == false {
//                    AppUtil().showNotification(msg: "Please accept terms and conditions.", type: .error)
//                } else {
//                  
//                }
//            }
//        }
    }
    
    var btnAlertHideClick:(() -> ()) = {}
    @IBAction func btnAlertHideClick(_ sender: Any) {
        btnAlertHideClick()
 
    }
    
    @IBAction func btnAgreeClick(_ sender: Any) {
        btnAgreed.isSelected = btnAgreed.isSelected  == true ? false : true
        imgCheck.image = UIImage(named: btnAgreed.isSelected ? "checkInBox" : "uncheckEnroll")
    }
}
