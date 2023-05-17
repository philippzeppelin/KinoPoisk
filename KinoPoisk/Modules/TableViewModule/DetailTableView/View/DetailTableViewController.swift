//
//  DetailTableView.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 15.05.2023.
//

import UIKit

class DetailTableViewController: UIViewController {
    var presenter: DetailViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        presenter?.setMovies()
    }
}

extension DetailTableViewController: DetailViewProtocol {
    func setMovies(film: Film?) {
        //
    }
}
