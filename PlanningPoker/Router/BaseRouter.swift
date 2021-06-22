//
//  BaseRouter.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import UIKit

class BaseRouter {
    
    func start(_ navigationController: UINavigationController) {
        //implement in child
    }
    
    func present(viewController: UIViewController, on navigationController: UINavigationController, animated: Bool = true, completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    func push(viewController: UIViewController, on navigationController: UINavigationController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
}
