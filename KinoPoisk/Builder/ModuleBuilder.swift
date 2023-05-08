//
//  ModuleBuilder.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 08.05.2023.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createTableViewModule(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    func createTableViewModule(router: RouterProtocol) -> UIViewController {
        let view = MainTableViewController()
        let networkService = NetworkService()
        let presenter = MainTableViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
}
