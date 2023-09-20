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
    let testButton: UIButton = .init()
    var timer: Timer?
    var isTimerRunning = false
    var seconds = 0
    var milliseconds = 0
    var minutes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
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
            make.bottom.equalToSuperview().offset(-185)
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
        timerLabel.text = "00:00,00"
        timerLabel.font = UIFont(name: "Helvetica-Bold", size: 36)
        timerLabel.textColor = .white
        timerLabel.layer.borderColor = UIColor.darkText.cgColor
        timerLabel.layer.cornerRadius = 8
        timerLabel.shadowColor = .systemBlue
        timerLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        timerLabel.textAlignment = .center
        timerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(45)
        }
        
    
        view.addSubview(resetButton)
        resetButton.setTitle("RESET", for: .normal)
        resetButton.titleLabel?.textColor = .systemGray2
        resetButton.backgroundColor = .systemBlue
        resetButton.layer.cornerRadius = 10
        resetButton.layer.borderColor = UIColor.darkText.cgColor
        resetButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        resetButton.addTarget(self, action: #selector(resetButtonAction), for: .touchUpInside)
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(startButton.snp.bottom).offset(25)
            make.right.left.equalToSuperview().inset(55)
            make.height.equalTo(45)
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
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
        } else {
            stopButtonAction()
        }
    }
    
    @objc func stopButtonAction() {
        if isTimerRunning {
            isTimerRunning = false
            startButton.setTitle("Start Training!", for: .normal)
            startButton.backgroundColor = .systemBlue
            startButton.isEnabled = true
            stopButton.isEnabled = false
            resetButton.isEnabled = true
            timer?.invalidate()
        }
    }
    
    @objc func resetButtonAction() {
        UIView.animate(withDuration: 0.8, animations: {
            self.resetButton.backgroundColor = .systemGray2
        })
        UIView.animate(withDuration: 0.3, animations: {
            self.resetButton.backgroundColor = .systemBlue
        })
        
        let originalTextColor = startButton.titleLabel?.textColor
        
        
        if isTimerRunning {
            isTimerRunning = false
            timer?.invalidate()
        }
        milliseconds = 0
        seconds = 0
        minutes = 0
        
        timerLabel.text = "00:00.00"
        startButton.setTitle("Start Training!", for: .normal)
        startButton.isEnabled = true
        startButton.titleLabel?.textColor = originalTextColor
        stopButton.isEnabled = false
        resetButton.isEnabled = false
    }
    
    
    @objc func updateTimer() {
        milliseconds += 1
        if milliseconds == 300 {
            milliseconds = 0
            seconds += 1
            if seconds == 60 {
                seconds = 0
                minutes += 1
            }
        }
        
        timerLabel.text = String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
        
    }
       
}
