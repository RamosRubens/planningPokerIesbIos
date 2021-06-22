//
//  AppDelegate.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: Coordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = application.windows.first ?? UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        coordinator = Coordinator(window: window)
        coordinator?.start()
        
        return true
    }
}


