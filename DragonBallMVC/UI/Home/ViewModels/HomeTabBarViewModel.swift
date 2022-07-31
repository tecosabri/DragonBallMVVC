//
//  HomeTabBarViewModel.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 22/7/22.
//

import Foundation


protocol HomeTabBarViewModelProtocol: AnyObject{
    func onViewLoaded()
}

class HomeTabBarViewModel {
    // MARK: - Private properties
    private weak var viewDelegate: HomeTabBarViewControllerProtocol?
    
    // MARK: - Lifecycle
    init(viewDelegate: HomeTabBarViewControllerProtocol){
        self.viewDelegate = viewDelegate
    }
    
    
}

// MARK: - SplashViewModelProtocol extension
extension HomeTabBarViewModel: HomeTabBarViewModelProtocol {
    func onViewLoaded() {
        viewDelegate?.navigateToHeroesCollection()
    }
}
