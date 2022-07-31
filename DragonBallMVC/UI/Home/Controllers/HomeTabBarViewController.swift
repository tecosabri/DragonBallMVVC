//
//  HomeTabBarViewController.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 22/7/22.
//

import UIKit

protocol HomeTabBarViewControllerProtocol: AnyObject {
    func navigateToHeroesCollection()
}

class HomeTabBarViewController: UITabBarController {
    // MARK: - Public properties
    var homeTabBarViewModel: HomeTabBarViewModelProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        homeTabBarViewModel?.onViewLoaded()
    }
    
    private func configureViews(){
        homeTabBarViewModel = HomeTabBarViewModel(viewDelegate: self)
        navigationItem.hidesBackButton = true
        navigationItem.title = "Heroes"
    }
}

extension HomeTabBarViewController: HomeTabBarViewControllerProtocol {
    // MARK: - Navigation
    private func createVilainsCollection() -> HeroesCollectionViewController {
        let vilainsCollectionViewController = HeroesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        vilainsCollectionViewController.isVilains = true
        return vilainsCollectionViewController
    }
    private func setVilainsTabBarItem(vilainsCollectionViewController: HeroesCollectionViewController) {
        vilainsCollectionViewController.tabBarItem = UITabBarItem(title: "Vilains", image: UIImage(named: "devil.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), tag: 1)
    }
    private func createHeroesCollection() -> HeroesCollectionViewController {
        let heroesCollectionViewController = HeroesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        heroesCollectionViewController.isVilains = false
        return heroesCollectionViewController
    }
    private func setHeroesTabBarItem(heroesCollectionViewController: HeroesCollectionViewController) {
        heroesCollectionViewController.tabBarItem = UITabBarItem(title: "Heroes", image: UIImage(named: "angel.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), tag: 0)
    }
    func navigateToHeroesCollection() {
        let heroes = createHeroesCollection()
        let vilains = createVilainsCollection()
        setVilainsTabBarItem(vilainsCollectionViewController: vilains)
        setHeroesTabBarItem(heroesCollectionViewController: heroes)
        viewControllers = [heroes, vilains]
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == tabBar.items?[0] {
            navigationItem.title = "Heroes"
        } else {
            navigationItem.title = "Vilains"
        }
    }
}
