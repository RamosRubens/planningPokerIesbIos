//
//  SprintInteractor.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import Foundation
import RxSwift

protocol SprintInteractorOutput: AnyObject {
    func getSprints(sprints: [Sprint])
    func getSprint(sprint: Sprint)
    func errorOccured(error: Error)
    func sprintWasDeleted()
}

protocol SprintInteractorInput: AnyObject {
    func getSprints()
    func getSprint(by id: Int)
    func deleteSprint(by id: Int)
}

class SprintInteractor {
    weak var output: SprintInteractorOutput?
    let dispose = DisposeBag()
}

extension SprintInteractor : SprintInteractorInput {
    func getSprint(by id: Int) {
        SprintDAO.getSprint(by: id).subscribe { [weak self] event in
            if let sprint = event.element {
                self?.output?.getSprint(sprint: sprint)
            }
            if let error = event.error {
                self?.output?.errorOccured(error: error)
            }
        }.disposed(by: dispose)
    }
    
    func getSprints() {
        SprintDAO.getSprints().subscribe { [weak self] event in
            if let sprint = event.element {
                self?.output?.getSprints(sprints: sprint)
            }
            if let error = event.error {
                self?.output?.errorOccured(error: error)
            }
        }.disposed(by: dispose)
    }
    
    func deleteSprint(by id: Int) {
        SprintDAO.deleteSprint(by: id)
            .subscribe { [weak self] result in
                guard let _ = result.element else {
                    self?.output?.errorOccured(error: NSError() as Error)
                    return
                }
                
                self?.output?.sprintWasDeleted()
            }.disposed(by: dispose)
    }
}
