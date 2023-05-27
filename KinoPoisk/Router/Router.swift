//
//  Router.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 08.05.2023.
//

import UIKit

protocol RouterMain {
    var builder: ModuleBuilderProtocol? { get set }
    var rootController: UINavigationController? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(film: Film)
}

final class Router: RouterProtocol {
    var builder: ModuleBuilderProtocol?
    var rootController: UINavigationController?

    init(builder: ModuleBuilderProtocol,
         rootController: UINavigationController) {
        self.builder = builder
        self.rootController = rootController
    }

    func initialViewController() {
        let mainViewController = builder?.createMainTableViewModule(router: self)
        rootController?.pushViewController(mainViewController!, animated: true)
    }

    func showDetail(film: Film) {
        if let rootController = rootController {
            guard let detailTableView = builder?.createDetailTableViewModule(router: self, film: film) else { return }
            rootController.pushViewController(detailTableView, animated: true)
        }
    }
}
