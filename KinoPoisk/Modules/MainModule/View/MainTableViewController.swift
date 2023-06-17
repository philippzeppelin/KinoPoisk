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
    private var filmList: [Film] = []
    private var movies: [Movies] = []

    private let containerView = MainTableViewContainerView { event in
        switch event {
        case .cellTapped: print("tap")
        }
    }

    // MARK: - UI
    override func loadView() {
        super.loadView()
        containerView.presenter = presenter
        view = containerView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        setupNavigationController()
        presenter?.getMovies()
    }
}

extension MainTableViewController: MainTableViewProtocol {
    func success() {
//        tableView.reloadData()
        containerView.tableView.reloadData()
    }

    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

    // MARK: - Setup UI
extension MainTableViewController {
    private func setupNavigationController() {
        navigationItem.title = Localization.navigationBarTitle.localized
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isHidden = false
    }
}
