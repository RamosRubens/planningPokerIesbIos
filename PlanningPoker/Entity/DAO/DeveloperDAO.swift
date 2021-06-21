//
//  DeveloperDAO.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import Foundation
import RxSwift
import RxAlamofire

struct DeveloperDAO {
    static let kBaseURL: String = "https://scrum-deck-backend.herokuapp.com"
    
    static func addDeveloper(newDeveloper: Developer) -> Observable<Developer>{
        return RxAlamofire
            .requestDecodable(.post, "\(kBaseURL)/desenvolvedor")
            .debug()
            .map{(response, developer: Developer) in
                return developer
            }
    }
    
    static func getDeveloperById(by id: Int) -> Observable<Developer> {
        return RxAlamofire
            .requestDecodable(.get, "\(kBaseURL)/desenvolvedor/\(id)")
            .debug()
            .map { (response, developer: Developer) in
                return developer
            }
    }
    
    static func getDeveloperByEmail(by email: String) -> Observable<Developer> {
        return RxAlamofire
            .requestDecodable(.get, "\(kBaseURL)/desenvolvedor/email/\(email)")
            .debug()
            .map { (response, developer: Developer) in
                return developer
            }
    }
}
