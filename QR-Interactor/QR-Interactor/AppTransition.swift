//
//  AppTransition.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

enum AppTransition {
    case showFirst
    
    // MARK: Functions
    
    func coordinatorFor<R: AppRouter>(router: R) -> Coordinator {
        return switch self {
            case .showFirst: FirstCoordinator(router: router)
        }
    }
}

// MARK: Identifier

extension AppTransition {
    var identifier: String { String(describing: self) }
}
