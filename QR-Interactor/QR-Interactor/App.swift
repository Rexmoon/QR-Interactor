//
//  App.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

import UIKit

final class App {
    
    // MARK: Properties
    
    var navigationController: UINavigationController = .init()
}

// MARK: Coordinator

extension App: Coordinator {
    func start() {
        process(route: .showFirst)
    }
}

// MARK: AppRouter

extension App: AppRouter {
    func process(route: AppTransition) {
        let coordinator = route.coordinatorFor(router: self)
        coordinator.start()
        debugPrint("Processing: \(route.identifier)")
    }
    
    func exit() {
        navigationController.popToRootViewController(animated: true)
    }
}
