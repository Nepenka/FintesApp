//
//  ReristrViewController.swift
//  FitnessApp
//
//  Created by 123 on 10.08.23.
//

import UIKit
import SnapKit


class SiginController: UIViewController {
    
    
    let firstNameField = PaddingTextField()
    let lastNameField = PaddingTextField()
    let passwordField = UITextField(frame: CGRect(x: 50, y: 100, width: 200, height: 40))
    var loginField = UITextField(frame: CGRect(x: 50, y: 100, width: 200, height: 40))
    let continueButton: UIButton = .init()
    let label: UILabel = .init()
    let signUpLabel: UILabel = .init()
    let backButton: UIButton = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
        setupUI()
        
    }
    
    func setupUI() {
        
        view.addSubview(signUpLabel)
        signUpLabel.text = "SIGN UP"
        signUpLabel.font = UIFont.boldSystemFont(ofSize: 35)
        signUpLabel.textAlignment = .center
        signUpLabel.textColor = .darkText
        signUpLabel.shadowColor = .systemBlue
        signUpLabel.shadowOffset = CGSize(width: 1, height: 2)
        signUpLabel.numberOfLines = 0
        
        signUpLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250)
            make.right.left.equalToSuperview().inset(25)
        }
        
        view.addSubview(firstNameField)
        firstNameField.placeholder = "First name"
        firstNameField.keyboardType = .default
        firstNameField.layer.borderWidth = 2
        firstNameField.font = UIFont(name: "Helvetica-Bold", size: 15)
        firstNameField.layer.cornerRadius = 10
        firstNameField.backgroundColor = .white
        
        firstNameField.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(35)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(210)
            make.height.equalTo(40)
        }
        
        view.addSubview(lastNameField)
        lastNameField.placeholder = "Last name"
        lastNameField.keyboardType = .default
        lastNameField.layer.borderWidth = 2
        lastNameField.font = UIFont(name: "Helvetica-Bold", size: 15)
        lastNameField.layer.cornerRadius = 10
        lastNameField.backgroundColor = .white
        
        lastNameField.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(35)
            make.left.equalTo(firstNameField.snp.right).offset(40)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        view.addSubview(loginField)
        
        let paddingViewWidth: CGFloat = 40
        let iconAndPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingViewWidth, height: loginField.frame.height))
        let personIcon = UIImageView(image: UIImage(systemName: "person.fill"))
        personIcon.frame = CGRect(x: 0, y: 0, width: paddingViewWidth, height: loginField.frame.height)
        personIcon.contentMode = .center
        iconAndPaddingView.addSubview(personIcon)
        loginField.leftView = iconAndPaddingView
        loginField.leftViewMode = .always
        
        loginField.placeholder = "Login"
        loginField.keyboardType = .default
        loginField.layer.borderWidth = 2
        loginField.font = UIFont(name: "Helvetica-Bold", size: 24)
        loginField.layer.cornerRadius = 10
        loginField.backgroundColor = .white
        
        loginField.snp.makeConstraints { make in
            make.top.equalTo(firstNameField.snp.bottom).offset(45)
            make.right.left.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordField)
        
        let paddingView: CGFloat = 40
        let iconPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingView, height: passwordField.frame.height))
        let lockIcon = UIImageView(image: UIImage(systemName: "lock.fill"))
        lockIcon.frame = CGRect(x: 0, y: 0, width: paddingView, height: passwordField.frame.height)
        lockIcon.contentMode = .center
        iconPaddingView.addSubview(lockIcon)
        
        passwordField.leftView = iconPaddingView
        passwordField.leftViewMode = .always
        
        passwordField.placeholder = "Password"
        passwordField.keyboardType = .default
        passwordField.layer.borderWidth = 2
        passwordField.font = UIFont(name: "Helvetica-Bold", size: 24)
        passwordField.layer.cornerRadius = 10
        passwordField.backgroundColor = .white
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(loginField.snp.bottom).offset(45)
            make.right.left.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        view.addSubview(continueButton)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.backgroundColor = .systemBlue
        continueButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        continueButton.layer.cornerRadius = 10
        continueButton.addTarget(self, action: #selector(continueButtonAction), for: .touchUpInside)
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(40)
            make.right.left.equalToSuperview().inset(55)
            make.height.equalTo(50)
            
        }
        
        view.addSubview(label)
        label.text = "Already have an account? "
        label.textColor = .gray
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.shadowColor = .systemBlue
        label.shadowOffset = CGSize(width: 1, height: 0)
        label.numberOfLines = 0
        label.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(80)
        }
        
        view.addSubview(backButton)
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.textColor = .systemBlue
        backButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        backButton.snp.makeConstraints { make in
            make.left.equalTo(label.snp.right).offset(-50)
            make.top.equalTo(continueButton.snp.bottom).offset(14)
        }
        
    }
    
    @objc func continueButtonAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.continueButton.backgroundColor = .systemGray2
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.continueButton.backgroundColor = .systemBlue
        })
    }
    
    @objc func backButtonAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.backButton.titleLabel?.textColor = .white
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.backButton.titleLabel?.textColor = .systemGray2
        })
        
    }
    
}
