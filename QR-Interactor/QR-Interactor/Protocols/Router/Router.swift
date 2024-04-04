//
//  Router.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

import UIKit

protocol Router {
    associatedtype Route
    var navigationController: UINavigationController { get set }
    func process(route: Route)
    func exit()
}
