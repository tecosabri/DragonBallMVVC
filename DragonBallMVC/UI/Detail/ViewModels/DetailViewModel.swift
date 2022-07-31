//
//  DetailViewModel.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 30/7/22.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    func onViewLoad()
}

class DetailViewModel {
    // MARK: - Public properties
    var detailImage: String?
    var detailName: String?
    var detailDescription: String?

    // MARK: - Private properties
    private weak var detailViewDelegate: DetailViewControllerProtocol?
    
    // MARK: - Lifecycle
    init(detailViewDelegate: DetailViewControllerProtocol?) {
        self.detailViewDelegate = detailViewDelegate
    }
}

extension DetailViewModel: DetailViewModelProtocol {
    func onViewLoad() {
        guard let detailImage = detailImage,
              let detailName = detailName,
              let detailDescription = detailDescription
        else {return}
        detailViewDelegate?.update(detailImage: detailImage)
        detailViewDelegate?.update(detailName: detailName)
        detailViewDelegate?.update(detailDescription: detailDescription)
    }
}
