//
//  Hero.swift
//  DragonBallMVC
//
//  Created by Ismael Sabri Pérez on 27/7/22.
//

import Foundation

typealias Heroes = [HeroModel]

struct HeroModel: Decodable{
    let id: String
    let name: String
    let description: String
    let photo: String
    let isVilain: Bool
}
