//
//  CustomCellViewModel.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 24/7/22.
//

import UIKit

protocol CustomCollectionCellViewModelProtocol: AnyObject {
    func onDataChanged(data: CustomCollectionCellViewModel)

}

class CustomCollectionCellViewModel {
    // MARK: - Public properties
    var characterImage: String?
    var characterName: String?
    
    // MARK: - Private properties
    private weak var customCollectionCellViewDelegate: CustomCollectionCellViewControllerProtocol?
    
    // MARK: Lifecycle
    init(customCollectionCellViewDelegate: CustomCollectionCellViewControllerProtocol?){
        self.customCollectionCellViewDelegate = customCollectionCellViewDelegate
    }
}

extension CustomCollectionCellViewModel: CustomCollectionCellViewModelProtocol {
    func onDataChanged(data: CustomCollectionCellViewModel) {
        self.characterImage = data.characterImage
        self.characterName = data.characterName
        customCollectionCellViewDelegate?.updateViews(characterImage: characterImage, characterName: characterName)
    }

}
