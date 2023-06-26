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
        navigationItem.title = Localization.navigationBarTitle.localized // localization
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.cellIdentifier,
                                                       for: indexPath) as? MovieCell else { return UITableViewCell() }
        guard let film = presenter?.films[indexPath.row] else { return cell }

        cell.backgroundColor = UIColor(red: 16/255, green: 14/255, blue: 15/255, alpha: 1.0) /// TODO: сделать в этой ветке
        cell.selectionStyle = .none

        if let movie = presenter?.films[indexPath.row] {
//            cell.updateUI(movies: movie)

            cell.configure(.init(



                movieNameRu: movie.rating,
                movieNameEn: movie.nameRu,
                rating: "\(movie.nameEn ?? "") (\(movie.year))",
                movieLength: movie.filmLength,
                ratingVoteCount: "\(movie.ratingVoteCount)",
                posterImageView: .imageURL(URL(string: movie.posterUrl)!),
                countries: movie.allCountries,
                genres: movie.allGenres


//                guard let ratingColor = Double(movie.rating) else { return }
//                switch ratingColor {
//                case 0..<5:  ratingLabel.textColor = .red
//                case 7...10: ratingLabel.textColor = .green
//                default: ratingLabel.textColor = .gray

                                ))
        } else {
            print("Ячейки не заполнились")
        }

        if let url = URL(string: film.posterUrl) {
            cell.posterImageView.kf.setImage(with: url) /// TODO: Кингфишер в конфигурацию в MovieCell
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
