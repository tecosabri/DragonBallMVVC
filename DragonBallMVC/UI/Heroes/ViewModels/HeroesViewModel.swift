//
//  HeroesViewModel.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 22/7/22.
//

import Foundation

protocol HeroesViewModelProtocol: AnyObject {
    var dataCount: Int {get}
    func onViewLoaded()
    func data(for index: Int, _ controller: CustomCollectionCellViewControllerProtocol) -> CustomCollectionCellViewModel
    func data(for index: Int, _ controller: DetailViewControllerProtocol) -> DetailViewModel
    func onSelectItem(at index: Int, _ controller: DetailViewController)
}

class HeroesViewModel {
    // MARK: - Private properties
    private weak var heroesCollectionViewDelegate: HeroesCollectionViewControllerProtocol?
    private var heroes: Heroes = []
    private let isVilains: Bool
    private var heroModelToCustomCollectionCellViewModel: HeroModelToCustomCollectionCellViewModelProtocol
    private var heroModelToDetailViewModel: HeroModelToDetailViewModelProtocol


    
    // MARK: - Lifecycle
    init(heroesCollectionViewDelegate: HeroesCollectionViewControllerProtocol?, isVilains: Bool) {
        self.heroesCollectionViewDelegate = heroesCollectionViewDelegate
        self.isVilains = isVilains
        heroModelToCustomCollectionCellViewModel = HeroModelToCustomCollectionCellViewModel()
        heroModelToDetailViewModel =  HeroModelToDetailViewModel()
    }
}

extension HeroesViewModel: HeroesViewModelProtocol {
    // MARK: - Public computed properties
    var dataCount: Int {
        heroes.count
    }
    
    // MARK: - Functions
    func onViewLoaded(){
        setHeroes(heroes: getHeroesFromJSON())
        filterHeroesOrVilains()
        heroesCollectionViewDelegate?.updateData()
    }
    private func getHeroesFromJSON() -> Heroes{
        guard let path = Bundle.main.path(forResource: "heroes", ofType: "json") else {return []}
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {return []}
        guard let heroes = try? JSONDecoder().decode(Heroes.self, from: data) else {return []}
        return heroes
    }
    private func setHeroes(heroes: Heroes){
        self.heroes = heroes
    }
    private func filterHeroesOrVilains(){
        heroes = isVilains ? heroes.filter{$0.isVilain} : heroes.filter{!$0.isVilain}
    }
    
    func data(for index: Int, _ controller: CustomCollectionCellViewControllerProtocol) -> CustomCollectionCellViewModel{
        guard let customCollectionCellViewModel = heroModelToCustomCollectionCellViewModel.map(hero: heroes[index], controller)
        else{
            return CustomCollectionCellViewModel(customCollectionCellViewDelegate: controller)
        }
        return customCollectionCellViewModel
    }
    
    func data(for index: Int, _ controller: DetailViewControllerProtocol) -> DetailViewModel {
        guard let detailViewModel = heroModelToDetailViewModel.map(hero: heroes[index], controller)
        else{
            return DetailViewModel(detailViewDelegate: controller)
        }
        return detailViewModel
    }

    func onSelectItem(at index: Int, _ controller: DetailViewController) {
        let data = data(for: index, controller)
        controller.detailViewModel = data
        heroesCollectionViewDelegate?.navigateTo(detail: controller)
    }
}
