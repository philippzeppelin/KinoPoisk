//
//  ModuleBuilder.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 08.05.2023.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createMainTableViewModule(router: RouterProtocol) -> UIViewController
    func createDetailTableViewModule(router: RouterProtocol, film: Film?) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    func createMainTableViewModule(router: RouterProtocol) -> UIViewController {
        let view = MainTableViewController()
        let networkService = NetworkService()
        let presenter = MainTableViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }

    func createDetailTableViewModule(router: RouterProtocol, film: Film?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailViewPresenter(view: view, networkService: networkService, router: router, film: film)
        view.presenter = presenter
        return view
    }
}
