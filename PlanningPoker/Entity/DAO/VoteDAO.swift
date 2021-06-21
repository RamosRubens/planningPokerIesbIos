//
//  VoteDAO.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import Foundation
import RxSwift
import RxAlamofire

struct VoteDAO {
    static let kBaseURL: String = "https://scrum-deck-backend.herokuapp.com"
    
    static func addVote(newVote: Vote) -> Observable<Vote>{
        return RxAlamofire
            .requestDecodable(.post, "\(kBaseURL)/voto")
            .debug()
            .map{(response, vote: Vote) in
                return vote
            }
    }
}
