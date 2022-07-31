//
//  SplashViewModel.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 22/7/22.
//

import Foundation


protocol SplashViewModelProtocol: AnyObject{
    func onViewLoaded()
}

class SplashViewModel {
    // MARK: - Private properties
    private weak var viewDelegate: SplashViewProtocol?
    
    // MARK: - Lifecycle
    init(viewDelegate: SplashViewProtocol){
        self.viewDelegate = viewDelegate
    }
}

// MARK: - SplashViewModelProtocol extension
extension SplashViewModel: SplashViewModelProtocol {
    func onViewLoaded() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewDelegate?.stopLoading()
            self.viewDelegate?.navigateToHome()
        }
    }
}
