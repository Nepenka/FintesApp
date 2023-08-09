//
//  RegistrationController.swift
//  FitnessApp
//
//  Created by 123 on 8.08.23.
//

import UIKit
import SnapKit


class RegistrationConttroler: UIViewController {
    
    let loginField = PaddingTextField()
    let passwordField = PaddingTextField()
    let loginLabel: UILabel = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
        setupUI()
        navigationItem.hidesBackButton = true
    }
    
    private func setupUI() {
        
        view.addSubview(loginLabel)
        loginLabel.text = "LOGIN"
        loginLabel.font = UIFont.boldSystemFont(ofSize: 35)
        loginLabel.textAlignment = .center
        loginLabel.textColor = .darkText
        loginLabel.shadowColor = .systemBlue
        loginLabel.shadowOffset = CGSize(width: 1, height: 2)
        loginLabel.numberOfLines = 0
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250)
            make.right.left.equalToSuperview().inset(25)
        }
        
        
    }
    
    
}
