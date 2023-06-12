//
//  Router.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 08.05.2023.
//

import UIKit

protocol RouterMain {
    var mainModuleBuilder: MainModuleBuilder? { get set }
    var rootController: UINavigationController? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(film: Film)
    func popToRoot()
}

final class Router: RouterProtocol {
    var mainModuleBuilder: MainModuleBuilder?
    var detailModuleBuilder: DetailModuleBuilder?
    var rootController: UINavigationController?

    init(mainModuleBuilder: MainModuleBuilder,
         detailModuleBuilder: DetailModuleBuilder,
         rootController: UINavigationController) {
        self.mainModuleBuilder = mainModuleBuilder
        self.detailModuleBuilder = detailModuleBuilder
        self.rootController = rootController
    }

    func initialViewController() {
        if let rootController = rootController {
            guard let mainViewController = mainModuleBuilder?.createMainTableViewModule(router: self) else { return }
            rootController.pushViewController(mainViewController, animated: true)
        }
    }

    func showDetail(film: Film) {
        if let rootController = rootController {
            guard let detailTableView = detailModuleBuilder?.createDetailTableViewModule(router: self, film: film) else { return }
            rootController.pushViewController(detailTableView, animated: true)
        }
    }

    func popToRoot() {
        if let rootController = rootController {
            rootController.popToRootViewController(animated: true)
        }
    }
}
