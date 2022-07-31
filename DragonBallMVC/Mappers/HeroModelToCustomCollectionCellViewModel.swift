//
//  HeroToCustomCollectionCellViewModel.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 27/7/22.
//

import UIKit

protocol HeroModelToCustomCollectionCellViewModelProtocol {
    func map(hero: HeroModel, _ controller: CustomCollectionCellViewControllerProtocol) -> CustomCollectionCellViewModel?
}

class HeroModelToCustomCollectionCellViewModel: HeroModelToCustomCollectionCellViewModelProtocol {
    func map(hero: HeroModel, _ controller: CustomCollectionCellViewControllerProtocol) -> CustomCollectionCellViewModel? {
        let customCollectionCellViewModel = CustomCollectionCellViewModel(customCollectionCellViewDelegate: controller)
        customCollectionCellViewModel.characterImage = hero.photo
        customCollectionCellViewModel.characterName = hero.name
        return customCollectionCellViewModel
    }
}
