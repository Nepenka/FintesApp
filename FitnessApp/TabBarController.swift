//
//  TabBarController.swift
//  FitnessApp
//
//  Created by 123 on 7.09.23.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstView = MenuViewController()
        let secondView = ActionViewController()
        let thirdView = CalendarViewController()
        
        viewControllers = [firstView,secondView,thirdView]
        
        firstView.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "filemenu.and.selection"), selectedImage: UIImage(systemName: "filemenu.and.selectionSelected"))
        secondView.tabBarItem = UITabBarItem(title: "Action", image: UIImage(systemName: "figure.walk.circle"), selectedImage: UIImage(systemName: "figure.walk.circleSelected"))
        thirdView.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), selectedImage: UIImage(systemName: "calendarSelected"))
    }
}
