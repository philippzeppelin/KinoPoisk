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
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(movies: Movies?)
}

class Router: RouterProtocol {
    var builder: ModuleBuilderProtocol?
    var rootController: UINavigationController?
    var mainTableViewController: UIViewController?

    init(builder: ModuleBuilderProtocol,
         rootController: UINavigationController,
         mainTableViewController: UIViewController) {
        self.builder = builder
        self.rootController = rootController
        self.mainTableViewController = mainTableViewController
    }

    func initialViewController() {
        let mainTableViewController = builder?.createMainTableViewModule(router: self)
        rootController?.pushViewController(mainTableViewController!, animated: true)
    }

    func showDetail(movies: Movies?) {
        if let rootController = rootController {
            guard let detailTableView = builder?.createDetailTableViewModule(router: self, movies: movies) else { return }
            rootController.pushViewController(detailTableView, animated: true)
        }
    }
}
