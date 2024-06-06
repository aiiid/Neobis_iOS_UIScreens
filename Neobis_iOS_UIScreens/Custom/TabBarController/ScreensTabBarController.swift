//
//  ScreensTabBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 28/05/2024.
//

import UIKit

class ScreensTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
    
    private func configureTabs() {
        let singlesViewController = UINavigationController(rootViewController: SinglesViewController())
        let portfolioViewController =  UINavigationController(rootViewController: PortfolioViewController())
        
        let weatherAppViewController =  UINavigationController(rootViewController: WeatherAppViewController())
        
        let travelViewController = TravelViewController()
        let walletViewController = WalletViewController()
//        let weatherAppViewController = WeatherAppViewController()
        
        singlesViewController.tabBarItem.image = UIImage(named: "help.png")
        travelViewController.tabBarItem.image = UIImage(named: "travel.png")
        portfolioViewController.tabBarItem.image = UIImage(named: "portfolio.png")
        walletViewController.tabBarItem.image = UIImage(named: "wallet.png")
        weatherAppViewController.tabBarItem.image = UIImage(named: "weather.png")
        
        singlesViewController.tabBarItem.title = "Singles"
        travelViewController.tabBarItem.title = "Travel"
        portfolioViewController.tabBarItem.title = "Portfolio"
        walletViewController.tabBarItem.title = "Wallet"
        weatherAppViewController.tabBarItem.title = "Weather"
        
        tabBar.tintColor = .magenta
        setViewControllers( [singlesViewController,
                            travelViewController,
                            portfolioViewController,
                            walletViewController,
                            weatherAppViewController], animated: true)
        tabBar.backgroundColor = .systemGray6
    }

}
