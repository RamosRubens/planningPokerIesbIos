//
//  Vote.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import Foundation

// MARK: - Vote
struct Vote: Codable {
    let idEstoria, idDesenvolvedor, pontos: Int
    let dataHora: String
}
