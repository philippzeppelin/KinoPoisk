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
    var movies: [Movies]? { get set }
    init(view: MainTableViewProtocol, networkService: NetworkServiceProtocol)
    func getMovies()
}

class MainTableViewPresenter: MainTableViewPresenterProtocol {
    private let dataProvider: TopFilmsDataProvidingProtocol
    weak var view: MainTableViewProtocol?
    let networkService: NetworkServiceProtocol?
    var movies: [Movies]?

    required init(view: MainTableViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getMovies()
    }

    func getMovies() {
        networkService?.getMovies(page: 1, completion: { [weak self] result in
            guard let self = self else { return }

                DispatchQueue.main.async {
                    switch result {
                    case .success(let model):
                        self.movies = model
                        self.view?.success()
                    case .failure(let error):
                        self.view?.failure(error: error)
                    }
                }
        })
    }

    func film(for indexPath: IndexPath) -> Films {
        dataProvider.gettingFilmForCell(for: indexPath)
    }
}
