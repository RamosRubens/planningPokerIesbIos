//
//  StoryDAO.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import Foundation
import RxSwift
import RxAlamofire

struct StoryDAO {
    static let kBaseURL: String = "https://scrum-deck-backend.herokuapp.com"
    
    static func endVoting(by id: Int) -> Observable<String> {
        return RxAlamofire
            .requestDecodable(.get, "\(kBaseURL)/estoria/\(id)/encerrar-votacao")
            .debug()
            .map { (response, status: String) in
                return status
            }
    }
    
    static func addStory(newStory: Story) -> Observable<Story>{
        return RxAlamofire
            .requestDecodable(.post, "\(kBaseURL)/estoria")
            .debug()
            .map{(response, story: Story) in
                return story
            }
    }
    
    static func getStoryById(by id: Int) -> Observable<Story> {
        return RxAlamofire
            .requestDecodable(.get, "\(kBaseURL)/estoria/\(id)")
            .debug()
            .map { (response, story: Story) in
                return story
            }
    }
    
    static func getStoryBySprintId(by idSprint: Int) -> Observable<[Story]> {
        return RxAlamofire
            .requestDecodable(.get, "\(kBaseURL)/estoria/sprint/\(idSprint)")
            .debug()
            .map { (response, story: [Story]) in
                return story
            }
    }
    
    static func deleteStory(by id: Int) -> Observable<String> {
        return RxAlamofire
            .requestDecodable(.delete, "\(kBaseURL)/estoria/\(id)")
            .debug()
            .map { (response, result: String) in
                return result
            }
    }
}
