//
//  MainTableViewController.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 10.04.2023.
//

import UIKit

final class MainTableViewController: UIViewController {
    var presenter: MainTableViewPresenterProtocol?
    var filmList = [Film]()
    var movies = [Movies]()

    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

        setup()

        tableView.dataSource = self
        tableView.delegate = self

        presenter?.getMovies()
    }

    // MARK: - Setup UI
    private func setup() {
        setupInterface()
        setupConstraint()
        setupNavigationController()
    }

    private func setupInterface() {
        view.addSubview(tableView)
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupNavigationController() {
        navigationItem.title = "Топ 250 фильмов"
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        guard let film = presenter?.films[indexPath.row] else { return cell }
//        let film = presenter?.films[indexPath.row]

        cell.backgroundColor = UIColor(red: 16/255, green: 14/255, blue: 15/255, alpha: 1.0)
        cell.selectionStyle = .none

        if let movie = presenter?.films[indexPath.row] {

            cell.updateUI(movies: movie)
        } else {
            print("Ячейки не заполнились")
        }

        if let url = URL(string: film.posterUrl) {
            cell.posterImageView.loadImage(url: url)
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
        let film = presenter?.films[indexPath.row]
        presenter?.goToDetailMovie(film: film)
        print("Tap cell")
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
