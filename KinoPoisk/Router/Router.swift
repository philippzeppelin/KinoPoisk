//
//  Router.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 08.05.2023.
//

import UIKit

protocol RouterMain {
    var builder: ModuleBuilderProtocol? { get set }
    var mainTableViewController: UIViewController? { get set }
    var rootController: UINavigationController? { get set }
//    var navigationController: UINavigationController? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
//    func showDetail()
//    button
}

class Router: RouterProtocol {
    var builder: ModuleBuilderProtocol?
    var rootController: UINavigationController?
    var mainTableViewController: UIViewController?

    init(builder: ModuleBuilderProtocol, rootController: UINavigationController ,mainTableViewController: UIViewController) {
        self.builder = builder
        self.rootController = rootController
        self.mainTableViewController = mainTableViewController
    }

    func initialViewController() {
        let mainTableViewController = builder?.createTableViewModule(router: self)
        rootController?.pushViewController(mainTableViewController!, animated: true)

    }





//    var navigationController: UINavigationController?
//    init(navigationController: UINavigationController, builder: ModuleBuilderProtocol) {
//        self.navigationController = navigationController
//        self.builder = builder
//    }
//
//    func initialViewController() {
//        if let navigationController = navigationController {
//            guard let mainViewController = builder?.createTableViewModule(router: self) else { return }
//            navigationController.viewControllers = [mainViewController]
//        }
//    }
}
