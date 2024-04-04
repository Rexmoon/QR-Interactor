//
//  AppTransition.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

enum AppTransition {
    case showFirst
    
    func coordinatorFor<R: AppRouter>(router: R) -> Coordinator {
        return switch self {
            case .showFirst: FirstCoordinator(router: router)
        }
    }
}

extension AppTransition {
    var identifier: String { String(describing: self) }
}
