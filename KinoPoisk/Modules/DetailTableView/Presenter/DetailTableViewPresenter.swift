//
//  DetailTableViewPresenter.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 15.05.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setMovies(film: Film?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, film: Film?)
    func setMovies()
}

final class DetailViewPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol?
    var film: Film?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, film: Film?) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.film = film
    }

    func setMovies() {
        self.view?.setMovies(film: film)
    }
}
