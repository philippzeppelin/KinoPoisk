//
//  MainTableViewController.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 10.04.2023.
//

import UIKit
import Kingfisher

final class MainTableViewController: UIViewController {
    var presenter: MainTableViewPresenterProtocol?
    var filmList = [Film]()
    var movies = [Movies]()

    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        embedView()
        setupLayout()
        setupNavigationController()

        tableView.dataSource = self
        tableView.delegate = self

        presenter?.getMovies()
    }
}

    // MARK: - Setup UI
extension MainTableViewController {
    private func embedView() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupNavigationController() {
        navigationItem.title = Localization.navBarTitle // localization
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isHidden = false
    }
}

// MARK: - Extensions
extension MainTableViewController: MainTableViewProtocol {
    func success() {
        tableView.reloadData()
    }

    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - UITableViewDataSource
extension MainTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let moviesCount = presenter?.films.count else { return 0 }
        return moviesCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.cellIdentifier, for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }

        if let movie = presenter?.films[indexPath.row] {
            let posterImageView: MovieCell.Content?

            if let posterUrl = URL(string: movie.posterUrl) {
                posterImageView = .imageURL(posterUrl)
            } else {
                posterImageView = nil
            }

            cell.configure(.init(
                movieNameRu: movie.nameRu,
                movieNameEn: "\(movie.nameEn ?? "") (\(movie.year))",
                rating: movie.rating,
                movieLength: movie.filmLength,
                ratingVoteCount: "\(movie.ratingVoteCount)",
                posterImageView: posterImageView,
                countries: movie.allCountries,
                genres: movie.allGenres
                ))

            // TODO: узнать куда можно впендюрить
//            guard let ratingColor = Double(movie.rating) else { return }
//            switch movie.rating {
//            case 0..<5:  rating.textColor = UIColor(.red)
//            case 7...10: cell.rating.textColor = .green
//            default: cell.rating.textColor = .gray
//            }
        } else {
            print("Ячейки не заполнились")
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let film = presenter?.films[indexPath.row] else { return }
        presenter?.goToDetailMovie(film: film)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        guard indexPath.row == lastRowIndex else { return }

        guard let presenter = presenter else { return }
        if !presenter.isFetching {
            presenter.beginFetch()
        }
    }
}

extension MainTableViewController {
    enum Localization {
        static let navBarTitle: String = NSLocalizedString("Navigation_Bar_Title", comment: "NavigationBar title")
    }
}
