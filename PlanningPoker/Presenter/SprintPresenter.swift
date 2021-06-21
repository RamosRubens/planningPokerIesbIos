//
//  SprintPresenter.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import Foundation
import RxCocoa

protocol SprintPresenterToView: AnyObject {
    var sprints: BehaviorRelay<[Sprint]?> { get }
    var sprint: BehaviorRelay<Sprint?> { get }
    func getSprints()
    func getSprint(by id: Int)
    func deleteSprint(by id: Int)
}

class SprintPresenter {
    
    weak var viewToPresenter: SprintPresenterToView?
    var interactorOutput: SprintInteractorOutput?
    
    var interactor: SprintInteractor?
    var view: SprintView?
    
    private(set) var sprints = BehaviorRelay<[Sprint]?>(value: nil)
    private(set) var sprint = BehaviorRelay<Sprint?>(value: nil)
}

extension SprintPresenter: SprintPresenterToView {
    
    func getSprints() {
        view?.setLoading(true)
        interactor?.getSprints()
    }
    
    func getSprint(by id: Int) {
        view?.setLoading(true)
        interactor?.getSprint(by: id)
    }
    
    func deleteSprint(by id: Int) {
        view?.setLoading(true)
        interactor?.deleteSprint(by: id)
    }
}

extension SprintPresenter: SprintInteractorInput {
    
    func listSprints(sprints: [Sprint]) {
        view?.setLoading(false)
        self.sprints.accept(sprints)
    }
    
    func showSprint(sprint: Sprint) {
        view?.setLoading(false)
        self.sprint.accept(sprint)
    }
    
    func sprintWasDeleted() {
        view?.setLoading(false)
    }
}
