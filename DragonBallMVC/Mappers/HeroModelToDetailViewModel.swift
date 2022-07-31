//
//  HeroModelToDetailViewModel.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 30/7/22.
//

import UIKit

protocol HeroModelToDetailViewModelProtocol {
    func map(hero: HeroModel, _ controller: DetailViewControllerProtocol) -> DetailViewModel?
}

class HeroModelToDetailViewModel: HeroModelToDetailViewModelProtocol {
    func map(hero: HeroModel, _ controller: DetailViewControllerProtocol) -> DetailViewModel? {
        let detailViewModel = DetailViewModel(detailViewDelegate: controller)
        detailViewModel.detailImage = hero.photo
        detailViewModel.detailDescription = hero.description
        detailViewModel.detailName = hero.name
        return detailViewModel
    }
}
