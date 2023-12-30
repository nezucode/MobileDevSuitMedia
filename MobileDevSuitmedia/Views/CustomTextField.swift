//
//  CustomTextField.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 29/12/23.
//

import UIKit

class CustomTextField: UITextField {
    enum CustomTextFieldType {
        case name
        case palindrome
    }
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType){
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .name:
            self.placeholder = "Name"
        case .palindrome:
            self.placeholder = "Palindrome"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
