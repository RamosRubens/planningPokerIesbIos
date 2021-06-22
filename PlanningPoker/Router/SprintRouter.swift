//
//  SprintRouter.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import UIKit

class SprintRouter: BaseRouter {
    
    let view = UIView(frame: UIScreen.main.bounds)
    let viewController = SprintViewController(nibName: "SprintViewController", bundle: .main)
    let presenter = SprintPresenter()
    let interactor = SprintInteractor()
    
    override init() {
        super.init()
        setupModule()
    }
    
    override func start(_ navigationController: UINavigationController) {
        navigationController.navigationBar.prefersLargeTitles = true
        super.push(viewController: viewController, on: navigationController)
    }
    
    private func setupModule() {
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.output = presenter.interactorOutput
    }
    
}

