//
//  Router.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 08.05.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var builder: ModuleBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
//    func showDetail()
//    button
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var builder: ModuleBuilderProtocol?

    init(navigationController: UINavigationController, builder: ModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }

    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = builder?.createTableViewModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
}
