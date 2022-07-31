//
//  CustomCollectionViewCell.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 23/7/22.
//

import UIKit

protocol CustomCollectionCellViewControllerProtocol: AnyObject{
     func updateViews(characterImage: String?, characterName: String?)
}

class CustomCollectionCellViewController: UICollectionViewCell {
    // MARK: - Public properties
    var customCollectionCellViewModel: CustomCollectionCellViewModelProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }

    private func setViewModel(){
        customCollectionCellViewModel = CustomCollectionCellViewModel(customCollectionCellViewDelegate: self)
    }
    private func configureViews(){
        setViewModel()
    }
    
    override func prepareForReuse() {
        updateCharacterName(characterName: nil)
        updateCharacterImage(characterImage: nil)
    }
}

extension CustomCollectionCellViewController: CustomCollectionCellViewControllerProtocol {
    func updateViews(characterImage: String?, characterName: String?) {
        updateCharacterImage(characterImage: characterImage)
        updateCharacterName(characterName: characterName)
    }
    private func updateCharacterImage(characterImage: String?){
        guard let characterImage = characterImage else {return}
        self.characterImage.image = UIImage(named: characterImage)
    }
    private func updateCharacterName(characterName: String?){
        guard let characterName = characterName else {return}
        self.characterName.text = characterName
    }
    
    
}
