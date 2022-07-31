//
//  HeroesCollectionViewController.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 22/7/22.
//

import UIKit

// MARK: - Private properties
private let reuseIdentifier = "CustomCell"

protocol HeroesCollectionViewControllerProtocol: AnyObject {
    func updateData()
    func navigateTo(detail controller: DetailViewController)
}

class HeroesCollectionViewController: UICollectionViewController {
    // MARK: - Public properties
    var heroesViewModel: HeroesViewModelProtocol?
    var isVilains: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        heroesViewModel?.onViewLoaded()
    }
    
    private func setViewModel(){
        heroesViewModel = HeroesViewModel(heroesCollectionViewDelegate: self, isVilains: self.isVilains)
    }
    private func registerNib(){
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    private func configureViews(){
        setViewModel()
        registerNib()
        
    }
}

extension HeroesCollectionViewController: HeroesCollectionViewControllerProtocol, UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroesViewModel?.dataCount ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CustomCollectionCellViewController
        else {
            return CustomCollectionCellViewController()
        }
        // Present data on cell
        guard let data = heroesViewModel?.data(for: indexPath.row, cell)
        else{
            return CustomCollectionCellViewController()
        }
        cell.customCollectionCellViewModel?.onDataChanged(data: data)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController(nibName: "Detail", bundle: nil)
        heroesViewModel?.onSelectItem(at: indexPath.row, controller)
    }
    
    // MARK: - UICollectionDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2), height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: Protocol functions
    func updateData() {
        collectionView.reloadData()
    }
    
    func navigateTo(detail controller: DetailViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }

}
