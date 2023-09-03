//
//  ActionViewController.swift
//  FitnessApp
//
//  Created by 123 on 3.09.23.
//

import UIKit
import SnapKit

class ActionViewController: UIViewController {
    
    let button: UIButton = .init()
    let imageView: UIImageView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
        navigationItem.hidesBackButton = true
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(button)
        button.setTitle("Start Training", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPraxisAction), for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.right.left.equalToSuperview().inset(55)
            make.height.equalTo(50)
            
        }

    }
    
    @objc func buttonPraxisAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.button.backgroundColor = .systemGray2
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.button.backgroundColor = .systemBlue
        })
        
    }
}
