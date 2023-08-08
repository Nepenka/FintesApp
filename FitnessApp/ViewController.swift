//
//  ViewController.swift
//  FitnessApp
//
//  Created by 123 on 8.08.23.
//

import UIKit
import SnapKit



class ViewController: UIViewController {
    
    let button: UIButton = .init()
    let welcomeLabel: UILabel = .init()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
    }
    
    func setupUI() {
        view.addSubview(button)
        button.setTitle("GET STARTED", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        button.layer.cornerRadius = 10
        
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(45)
            make.trailing.equalToSuperview().inset(45)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(85)
            make.height.equalTo(50)
        }
        
        
        
        view.addSubview(welcomeLabel)
        welcomeLabel.text = "Welcome! It's a application FitFusion. This is a fitness app. This is another one of my small projects."
        welcomeLabel.font = UIFont(name: "Helvetica-Bold", size: 26)
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .white
        welcomeLabel.shadowColor = .systemBlue
        welcomeLabel.shadowOffset = CGSize(width: 1, height: 0)
        welcomeLabel.numberOfLines = 0
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.right.left.equalToSuperview().inset(25)
        }
        
        
        
        
    }
    
    @objc func buttonAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.button.backgroundColor = .systemGray2
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.button.backgroundColor = .systemBlue
        })
        
        let regController = RegistrationConttroler()
        navigationController?.pushViewController(regController, animated: true)
        
        
    }

}

