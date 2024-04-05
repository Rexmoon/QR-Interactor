//
//  FirstCoordinator.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

import SwiftUI

final class FirstCoordinator<R: AppRouter> {
    
    var navigationController: UINavigationController {
        get { router.navigationController }
        set { router.navigationController = newValue }
    }
    
    private var router: R
    
    init(router: R) {
        self.router = router
    }
    
    private lazy var firstViewController: UIViewController = {
        UIHostingController(rootView: FirstView(router: self))
    }()
    
    private lazy var secondViewController: UIViewController = {
        UIHostingController(rootView: SecondView())
    }()
    
    private lazy var thirdViewController: UIViewController = {
        UIHostingController(rootView: ThirdView())
    }()
    
    private lazy var scannerView: UIViewController = {
        UIHostingController(rootView: QRScannerView())
    }()
}

extension FirstCoordinator: Coordinator {
    func start() {
        navigationController.pushViewController(firstViewController, animated: true)
    }
}

extension FirstCoordinator: FirstRouter {
    func process(route: FirstTransition) {
        switch route {
            case .showSecondView: navigationController.pushViewController(secondViewController, animated: true)
            case .showThirdView: navigationController.present(thirdViewController, animated: true)
            case .showScannerView: navigationController.present(scannerView, animated: true)
        }
    }
    
    func exit() {
        navigationController.popToRootViewController(animated: true)
    }
}
