//
//  DetailModuleBuilder.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 12.06.2023.
//

import UIKit

protocol DetailModuleBuilderProtocol {
    func createDetailTableViewModule(router: RouterProtocol, film: Film) -> UIViewController
}

class DetailModuleBuilder: DetailModuleBuilderProtocol {
    func createDetailTableViewModule(router: RouterProtocol, film: Film) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailViewPresenter(view: view, networkService: networkService, router: router, film: film)
        view.presenter = presenter

        return view
    }
}
