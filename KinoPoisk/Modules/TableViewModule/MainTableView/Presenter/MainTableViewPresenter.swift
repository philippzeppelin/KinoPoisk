//
//  TableViewPresenter.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 30.04.2023.
//

import Foundation

protocol MainTableViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainTableViewPresenterProtocol: AnyObject {
    var films: [Films] { get set }
    var isFetching: Bool { get set }
    init(view: MainTableViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getMovies()
    func beginFetch()
    func goToDetailMovie(movies: Movies?)
}

class MainTableViewPresenter: MainTableViewPresenterProtocol {
    weak var view: MainTableViewProtocol?
    let networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    var films: [Films] = []
    var isFetching = false
    var pageCounter = 1

    required init(view: MainTableViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }

    func getMovies() {
        networkService?.getMovies(page: pageCounter) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.films += model.films
                    self?.view?.success()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
                self?.isFetching = false
            }
        }
    }

    func beginFetch() {
        isFetching = true
        pageCounter += 1
        getMovies()
    }

    func goToDetailMovie(movies: Movies?) {
        router?.showDetail(movies: movies)
        print("tap")
    }
}
