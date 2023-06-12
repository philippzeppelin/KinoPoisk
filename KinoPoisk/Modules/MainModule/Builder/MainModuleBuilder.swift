//
//  MainModuleBuilder.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 12.06.2023.
//

import UIKit

protocol MainModuleBuilderProtocol {
    func createMainTableViewModule(router: RouterProtocol) -> UIViewController
}

class MainModuleBuilder: MainModuleBuilderProtocol {
    func createMainTableViewModule(router: RouterProtocol) -> UIViewController {
        let view = MainTableViewController()
        let networkService = NetworkService()
        let presenter = MainTableViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }
}
