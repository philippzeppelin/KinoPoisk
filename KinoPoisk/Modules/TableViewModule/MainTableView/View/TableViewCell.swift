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

    private let movieNameRuLabel: UILabel = {
        let label = UILabel()
        label.text = "Джон Уик 4"
        label.font = UIFont(name: "Arial Bold", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieNameEnLabel: UILabel = {
        let label = UILabel()
        label.text = "John Wick: Chapter 4"
        label.font = UIFont(name: "Arial", size: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let genresLabel: UILabel = {
        let label = UILabel()
        label.text = "боевик, триллер, криминал"
        label.font = UIFont(name: "Arial", size: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "7.7"
        label.font = UIFont(name: "Arial", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieLengthLabel: UILabel = {
        let label = UILabel()
        label.text = "2:49"
        label.font = UIFont(name: "Arial", size: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countriesLabel: UILabel = {
        let label = UILabel()
        label.text = "США, Германия"
        label.font = UIFont(name: "Arial", size: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingVoteCountLabel: UILabel = {
        let label = UILabel()
        label.text = "66 988"
        label.font = UIFont(name: "Arial", size: 17)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieYearLabel: UILabel = {
        let label = UILabel()
        label.text = "(2023)"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        cellView.addSubview(posterImageView)
        cellView.addSubview(movieNameRuLabel)
        cellView.addSubview(movieNameEnLabel)
        cellView.addSubview(genresLabel)
        cellView.addSubview(ratingLabel)
        cellView.addSubview(movieLengthLabel)
        cellView.addSubview(ratingVoteCountLabel)
        cellView.addSubview(movieYearLabel)
        cellView.addSubview(countriesLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            self.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: 8),
            self.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),

            posterImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            posterImageView.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 5),
            posterImageView.widthAnchor.constraint(equalToConstant: 85),
            cellView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 5),

            movieNameRuLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            movieNameRuLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),

            movieNameEnLabel.topAnchor.constraint(equalTo: movieNameRuLabel.bottomAnchor, constant: 3),
            movieNameEnLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),

            genresLabel.topAnchor.constraint(equalTo: movieNameEnLabel.bottomAnchor, constant: 2),
            genresLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),

            cellView.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 10),
            ratingLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),

            cellView.rightAnchor.constraint(equalTo: movieLengthLabel.rightAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: movieLengthLabel.bottomAnchor, constant: 10),

            ratingVoteCountLabel.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor, constant: 3),
            cellView.bottomAnchor.constraint(equalTo: ratingVoteCountLabel.bottomAnchor, constant: 10),

            movieYearLabel.topAnchor.constraint(equalTo: movieNameRuLabel.bottomAnchor, constant: 3),
            movieYearLabel.leftAnchor.constraint(equalTo: movieNameEnLabel.rightAnchor, constant: 5),

            movieLengthLabel.leftAnchor.constraint(equalTo: countriesLabel.rightAnchor, constant: 5),
            cellView.bottomAnchor.constraint(equalTo: countriesLabel.bottomAnchor, constant: 10)
        ])
    }
}

extension TableViewCell {
    func updateUI(model: Films) {
        movieNameRuLabel.text = model.nameRu
    }
}
