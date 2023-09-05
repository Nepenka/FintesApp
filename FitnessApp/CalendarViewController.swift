//
//  CalendarViewController.swift
//  FitnessApp
//
//  Created by 123 on 5.09.23.
//

import UIKit
import SnapKit


class CalendarViewController: UIViewController {
    
    let calendarView: UICalendarView = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
        navigationItem.hidesBackButton = true
    }
    
    func setupUI() {
        view.addSubview(calendarView)
        calendarView.backgroundColor = .white
                calendarView.calendar = .current
                calendarView.locale = .current
                calendarView.layer.borderColor = UIColor.black.cgColor
                calendarView.layer.borderWidth = 2
                calendarView.layer.cornerRadius = 10
                calendarView.tintColor = .systemMint
                calendarView.availableDateRange = DateInterval(start: .now, end: .distantFuture)
                
        calendarView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(50)
        }
        
    }
}
