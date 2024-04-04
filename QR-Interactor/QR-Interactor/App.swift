//
//  App.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

import UIKit

final class App {
    var navigationController: UINavigationController = .init()
}

extension App: Coordinator {
    func start() {
        process(route: .showFirst)
    }
}

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
