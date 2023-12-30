//
//  CustomButton.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 29/12/23.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.layer.backgroundColor = .init(red: 43/255, green: 99/255, blue: 123/255, alpha: 1)
        
        let setColor: UIColor = .white
        self.setTitleColor(setColor, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
