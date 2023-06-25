//
//  MainTableViewContainerView.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 17.06.2023.
//

import UIKit

class MainTableViewContainerView: UIView {
    private var event: MainTableEvent
    var presenter: MainTableViewPresenterProtocol?

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init(event: @escaping MainTableEvent) {
        self.event = event
        super.init(frame: .zero)

        embedView()
        setupLayout()

        tableView.dataSource = self
        tableView.delegate = self

        backgroundColor = .red
        presenter?.getMovies()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func embedView() {
        addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MainTableViewContainerView {
    typealias MainTableEvent = (Event) -> Void

    enum Event {
        case showMovie(index: Int)
//        case showMovie
    }
}

// MARK: - UITableViewDataSource
extension MainTableViewContainerView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let moviesCount = presenter?.films.count else { return 0 }
        return moviesCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier,
                                                       for: indexPath) as? TableViewCell else { return UITableViewCell() }
        guard let film = presenter?.films[indexPath.row] else { return cell }

        cell.backgroundColor = UIColor(red: 16/255, green: 14/255, blue: 15/255, alpha: 1.0)
        cell.selectionStyle = .none

        if let movie = presenter?.films[indexPath.row] {
            cell.updateUI(movies: movie)
        } else {
            print("Ячейки не заполнились")
        }

        if let url = URL(string: film.posterUrl) {
            cell.posterImageView.kf.setImage(with: url)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainTableViewContainerView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let film = presenter?.films[indexPath.row] else { return }
//        presenter?.showDetailMovie(film: film)
        event(.showMovie(index: indexPath.row))
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
