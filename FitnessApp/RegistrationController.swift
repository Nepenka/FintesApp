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
    let loginButton: UIButton = .init()
    let signLabel: UILabel = .init()
    let registerButton: UIButton = .init()
    
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
        
        view.addSubview(loginField)
        
        loginField.placeholder = "Login"
        loginField.keyboardType = .default
        loginField.layer.borderWidth = 2
        loginField.font = UIFont(name: "Helvetica-Bold", size: 24)
        loginField.layer.cornerRadius = 10
        loginField.backgroundColor = .white
        
        
        loginField.snp.makeConstraints { make in
                make.top.equalTo(loginLabel.snp.bottom).offset(45)
                make.right.left.equalToSuperview().inset(25)
                make.height.equalTo(50)
        }
        
        
        view.addSubview(passwordField)
        
        passwordField.placeholder = "Password"
        passwordField.keyboardType = .default
        passwordField.layer.borderWidth = 2
        passwordField.font = UIFont(name: "Helvetica-Bold", size: 24)
        passwordField.layer.cornerRadius = 10
        passwordField.backgroundColor = .white
        
        
        passwordField.snp.makeConstraints { make in
                make.top.equalTo(loginField.snp.bottom).offset(45)
                make.right.left.equalToSuperview().inset(25)
                make.height.equalTo(50)
            }
        
        view.addSubview(loginButton)
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(40)
            make.right.left.equalToSuperview().inset(55)
            make.height.equalTo(50)
            
        }
        
        view.addSubview(signLabel)
        signLabel.text = "Don't have an account? "
        signLabel.textColor = .gray
        signLabel.font = UIFont(name: "Helvetica-Bold", size: 14)
        signLabel.shadowColor = .systemBlue
        signLabel.shadowOffset = CGSize(width: 1, height: 0)
        signLabel.numberOfLines = 0
        signLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(80)
        }
        
        view.addSubview(registerButton)
        registerButton.setTitle("Sign up", for: .normal)
        registerButton.titleLabel?.textColor = .systemBlue
        registerButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        
        registerButton.snp.makeConstraints { make in
            make.left.equalTo(signLabel.snp.right).offset(-65)
            make.top.equalTo(loginButton.snp.bottom).offset(14)
        }
    }
    
    @objc func loginButtonAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.loginButton.backgroundColor = .systemGray2
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.loginButton.backgroundColor = .systemBlue
        })
        
        
        
    }
    
    @objc func registerButtonAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.registerButton.titleLabel?.textColor = .white
        }) { _ in
            
            UIView.animate(withDuration: 0.3, animations: {
                self.registerButton.titleLabel?.textColor = .systemGray2
            })
        }
        
        let signUp = SiginController()
        navigationController?.pushViewController(signUp, animated: true)
        
        
    }
}

