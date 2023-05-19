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

        let posterImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let movieNameRuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial Bold", size: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieNameEnLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let genresLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieLengthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countriesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingVoteCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieYearLabel: UILabel = {
        let label = UILabel()
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

    func updateUI(movies: Film) {
        movieNameRuLabel.text = movies.nameRu
        movieNameEnLabel.text = "\(movies.nameEn ?? "") (\(movies.year))"
        ratingLabel.text = movies.rating
        movieLengthLabel.text = movies.filmLength
        ratingVoteCountLabel.text = "\(movies.ratingVoteCount)"
        posterImageView.image = nil

        var genres: [String] = []
        for genre in movies.genres {
            genres.append(genre.genre)
        }
        genresLabel.text = genres.joined(separator: ", ")

        var countries: [String] = []
        for country in movies.countries {
            countries.append(country.country)
        }
        countriesLabel.text = countries.joined(separator: ", ")

        guard let ratingColor = Double(movies.rating) else { return }
        switch ratingColor {
        case 0..<5:  ratingLabel.textColor = .red
        case 7...10: ratingLabel.textColor = .green
        default: ratingLabel.textColor = .gray
        }
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
            posterImageView.widthAnchor.constraint(equalToConstant: 75),
            cellView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 5),

            movieNameRuLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            movieNameRuLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: movieNameRuLabel.rightAnchor, constant: 10),

            movieNameEnLabel.topAnchor.constraint(equalTo: movieNameRuLabel.bottomAnchor, constant: 3),
            movieNameEnLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: movieNameEnLabel.rightAnchor, constant: 10),

            genresLabel.topAnchor.constraint(equalTo: movieNameEnLabel.bottomAnchor, constant: 2),
            genresLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: genresLabel.rightAnchor, constant: 10),

            cellView.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 10),
            ratingLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 10),

            cellView.rightAnchor.constraint(equalTo: movieLengthLabel.rightAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: movieLengthLabel.bottomAnchor, constant: 10),

            ratingVoteCountLabel.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor, constant: 3),
            cellView.bottomAnchor.constraint(equalTo: ratingVoteCountLabel.bottomAnchor, constant: 10),

            movieYearLabel.topAnchor.constraint(equalTo: movieNameRuLabel.bottomAnchor, constant: 3),
            movieYearLabel.leftAnchor.constraint(equalTo: movieNameEnLabel.rightAnchor, constant: 5),

            countriesLabel.leftAnchor.constraint(equalTo: ratingVoteCountLabel.rightAnchor, constant: 2),
            movieLengthLabel.leftAnchor.constraint(equalTo: countriesLabel.rightAnchor, constant: 5),
            cellView.bottomAnchor.constraint(equalTo: countriesLabel.bottomAnchor, constant: 10)
        ])
    }
}
