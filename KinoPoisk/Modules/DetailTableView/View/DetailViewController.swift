//
//  DetailTableView.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 15.05.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var presenter: DetailViewPresenterProtocol?

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray

        presenter?.setMovies()

        setup()
    }

    @objc private func buttonPressed() {
        print("button pressed")
    }

    private func setup() {
        setupInterface()
        setupConstraints()
    }

    private func setupInterface() {
        view.addSubview(button)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func setMovies(film: Film?) {
        //
    }
}
