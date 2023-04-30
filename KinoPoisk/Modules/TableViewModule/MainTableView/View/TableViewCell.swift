//
//  TableViewCell.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 30.04.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let cellIdentifier = "cell"

    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupInterface()
        setupConstraints()
    }

    private func setupInterface() {
        self.addSubview(cellView)
        self.addSubview(posterImageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            self.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: 5),
            self.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 5),

            posterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            posterImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),


        ])
    }
}
