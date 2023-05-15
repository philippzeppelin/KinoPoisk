//
//  DetailTableViewPresenter.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 15.05.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setMovies(movies: Movies?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, movies: Movies?)
    func setMovies()
}

class DetailViewPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol?
    var movies: Movies?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, movies: Movies?) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.movies = movies
    }

    func setMovies() {
        self.view?.setMovies(movies: movies)
    }
}
