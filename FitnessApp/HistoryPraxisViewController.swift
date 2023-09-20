//
//  HistoryPraxisViewController.swift
//  FitnessApp
//
//  Created by 123 on 20.09.23.
//

import Foundation
import SnapKit


class HistoryPraxisViewController: UIViewController {
    
    let tableView = UITableView()
    var workoutHistory: [WorkoutInfo] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
        navigationItem.hidesBackButton = true
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
    }
    
    
    
    
    
}

extension HistoryPraxisViewController: UITableViewDelegate {
    
}

extension HistoryPraxisViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell

        let workoutInfo = workoutHistory[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: workoutInfo.date)
        cell.textLabel?.text = "Type of training: \(workoutInfo.exerciseType)"
        cell.detailTextLabel?.text = "Дата: \(dateString)"

        return cell
    }
}



class HistoryTableViewCell: UITableViewCell {
    
}
