//
//  SplashViewController.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 22/7/22.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    func stopLoading()
    func navigateToHome()
}

class SplashViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Public properties
    var viewModel: SplashViewModelProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewLoaded()
    }
}

// MARK: - SplashViewProtocol extension
extension SplashViewController: SplashViewProtocol {
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
    
    func navigateToHome() {
        let homeTabBarViewController = HomeTabBarViewController()
        navigationController?.pushViewController(homeTabBarViewController, animated: true)
    }
}
