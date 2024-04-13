//
//  MainTabBarViewController.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit
import SnapKit

final class MainTabBarViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.tintColor = UIColor(red: 0/255, green: 153/255, blue: 255/255, alpha: 1)
        tabBar.backgroundColor = .white
        
        setupTabs()
    }
    
    private func setupTabs() {
        let vc1 = UINavigationController(rootViewController: ReadingViewController())
        let vc2 = UINavigationController(rootViewController: SpeakingViewController())
        let vc3 = UINavigationController(rootViewController: GrammarViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        let vc5 = UINavigationController(rootViewController: LeadersViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "book.pages")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "book.pages.fill")
        vc2.tabBarItem.image = UIImage(systemName: "mic")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "mic.fill")
        vc3.tabBarItem.image = UIImage(systemName: "textformat")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "textformat.fill")
        vc4.tabBarItem.image = UIImage(systemName: "person.circle")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        vc5.tabBarItem.image = UIImage(systemName: "crown")
        vc5.tabBarItem.selectedImage = UIImage(systemName: "crown.fill")
        
        vc1.title = "Чтение"
        vc2.title = "Говорение"
        vc3.title = "Грамматика"
        vc4.title = "Профиль"
        vc5.title = "Лидеры"
        
        setViewControllers([vc1, vc2, vc3, vc5, vc4], animated: true)
    }
}
