//
//  Story.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import Foundation

// MARK: - Story
struct Story: Codable {
    let id, idSprint: Int
    let nome, link: String
    let pontuacao: Int
}
