//
//  TabBarController.swift
//  FitnessApp
//
//  Created by 123 on 7.09.23.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    let firstView = MenuViewController()
    let secondView = ActionViewController()
    let thirdView = CalendarViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarUI()
        setTabBarApperance()
    }
    private func tabBarUI() {
        
        viewControllers = [
        generateVC(viewController: firstView, title: "Menu", image: UIImage(systemName: "filemenu.and.selection")),
        generateVC(viewController: secondView, title: "Action", image: UIImage(systemName: "figure.walk.circle")),
        generateVC(viewController: thirdView, title: "Calendar", image: UIImage(systemName: "calendar"))
        ]
    }
    
    
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarApperance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        let bezeirPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: height / 2)
        roundLayer.path = bezeirPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
