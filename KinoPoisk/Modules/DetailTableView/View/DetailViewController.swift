//
//  DetailTableView.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 15.05.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var presenter: DetailViewPresenterProtocol?
    private var addedViewController: AddedViewController?

    private let posterImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = .magenta
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray

        presenter?.setMovies()

        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentAddedViewController()
    }

    func presentAddedViewController() {
        let addedView = AddedViewController()
        if let sheet = addedView.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 0
        }
        present(addedView, animated: true)


    }

    private func setup() {
        setupInterface()
        setupConstraints()
    }

    private func setupInterface() {
        view.addSubview(posterImageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            posterImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func setMovies(film: Film?) {
        //
    }
}
