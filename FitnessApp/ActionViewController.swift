//
//  ActionViewController.swift
//  FitnessApp
//
//  Created by 123 on 3.09.23.
//

import UIKit
import SnapKit

class ActionViewController: UIViewController {
    
    let startButton: UIButton = .init()
    let imageView: UIImageView = .init()
    let timerLabel: UILabel = .init()
    let stopButton: UIButton = .init()
    let resetButton: UIButton = .init()
    var timer: Timer?
    var isTimerRunning = false
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
        navigationItem.hidesBackButton = true
        setupUI()
    }
    
    func setupUI() {
        
        view.addSubview(startButton)
        startButton.setTitle("START TRAINING!", for: .normal)
        startButton.backgroundColor = .systemBlue
        startButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-90)
            make.right.left.equalToSuperview().inset(55)
            make.height.equalTo(50)
        }
        
        view.addSubview(stopButton)
        stopButton.setTitle("STOP!", for: .normal)
        stopButton.backgroundColor = .systemBlue
        stopButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        stopButton.layer.cornerRadius = 10
        stopButton.addTarget(self, action: #selector(stopButtonAction), for: .touchUpInside)
        
        view.addSubview(timerLabel)
        timerLabel.text = "0:00"
        timerLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        timerLabel.textColor = .white
        timerLabel.backgroundColor = .systemBlue
        timerLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            make.height.equalTo(45)
        }
        
        view.addSubview(resetButton)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.titleLabel?.textColor = .systemGray2
        resetButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        resetButton.addTarget(self, action: #selector(resetButtonAction), for: .touchUpInside)
        resetButton.snp.makeConstraints { make in
        
        }
        
    }
    
    @objc func startButtonAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.startButton.backgroundColor = .systemGray2
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.startButton.backgroundColor = .systemBlue
        })
        if !isTimerRunning {
                isTimerRunning = true
                startButton.setTitle("Stop", for: .normal)
                startButton.backgroundColor = .systemRed
                stopButton.isEnabled = true
                resetButton.isEnabled = false
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            } else {
                stopButtonAction()
                timerLabel.backgroundColor = .red
            }
    }
    
    @objc func stopButtonAction() {
        if isTimerRunning {
            isTimerRunning = false
            startButton.setTitle("Start Training", for: .normal)
            startButton.backgroundColor = .systemBlue
            timerLabel.backgroundColor = .systemRed
            startButton.isEnabled = true
            stopButton.isEnabled = false
            resetButton.isEnabled = true
            timer?.invalidate()
        }
    }
    
    @objc func resetButtonAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.startButton.titleLabel?.textColor = .systemGray2
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.startButton.titleLabel?.textColor = .systemBlue
        })
        isTimerRunning = false
            seconds = 0
            timerLabel.text = "0:00"
            startButton.isEnabled = true
            stopButton.isEnabled = false
            resetButton.isEnabled = false
            timer?.invalidate()
    }
    
    
    @objc func updateTimer() {
        seconds += 1
            let minutes = seconds / 60
            let secondsString = String(format: "%02d", seconds % 60)
            timerLabel.text = "\(minutes):\(secondsString)"
    }
    
}
