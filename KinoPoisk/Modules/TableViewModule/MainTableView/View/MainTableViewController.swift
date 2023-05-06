//
//  MainTableViewController.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 10.04.2023.
//

import UIKit

class MainTableViewController: UIViewController {
    var presenter: MainTableViewPresenterProtocol?

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

//        presenter = MainTableViewPresenter(view: self, networkService: NetworkService)
    }

    // MARK: - Setup UI
    private func setup() {
        setupInterface()
        setupConstraint()
        setupNavigationController()
        NetworkService().getMovies(page: 1, completion: { _ in })
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
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor(red: 16/255, green: 14/255, blue: 15/255, alpha: 1.0)
        cell.selectionStyle = .none
        if let model = presenter?.movies(for: indexPath) {

        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap cell")
    }
}
