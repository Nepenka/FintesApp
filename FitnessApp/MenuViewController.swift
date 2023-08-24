//
//  StartViewController.swift
//  FitnessApp
//
//  Created by 123 on 11.08.23.
//


import UIKit
import SnapKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Praxis.praxis.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = Praxis.praxis[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.layer.borderColor = UIColor.darkText.cgColor
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 15)
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    let calendarView = UICalendarView()
    let tableView = UITableView.init(frame: .zero, style: .grouped)
   
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
   
    
}


class TableViewCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
    }
}
