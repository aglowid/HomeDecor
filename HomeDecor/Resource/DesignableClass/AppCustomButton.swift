//
//  AppCustomButton.swift
//  TournamentApp
//
//  Created by Aglowid IT Solutions on 06/12/21.
//

import UIKit

class AppCustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    private func setFonts() {
        
    }
}
