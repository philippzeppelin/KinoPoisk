//
//  TableViewCell.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 30.04.2023.
//

import UIKit

final class TableViewCell: UITableViewCell {
    static let cellIdentifier = "cell"

    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let movieNameRuLabel: UILabel = {
        let label = UILabel()
        label.font = .arialBold15()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieNameEnLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let genresLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieLengthLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countriesLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingVoteCountLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .gray
        label.textAlignment = .left
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
        embedView()
        setupLayout()
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
}

// MARK: - Setup UI
extension TableViewCell {
    private func embedView() {
        addSubview(cellView)
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

    private func setupLayout() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: .cellViewTopLeftRightAnchor),
            cellView.leftAnchor.constraint(equalTo: leftAnchor, constant: .cellViewTopLeftRightAnchor),
            rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: .cellViewTopLeftRightAnchor),
            bottomAnchor.constraint(equalTo: cellView.bottomAnchor),

            posterImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: .posterImageViewTopLeftBottomAnchor),
            posterImageView.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: .posterImageViewTopLeftBottomAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: .posterImageViewWidth),
            cellView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: .posterImageViewTopLeftBottomAnchor),

            movieNameRuLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: .movieNameRuLabelTopLeftRightAnchor),
            movieNameRuLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: .movieNameRuLabelTopLeftRightAnchor),
            cellView.rightAnchor.constraint(equalTo: movieNameRuLabel.rightAnchor, constant: .movieNameRuLabelTopLeftRightAnchor),

            movieNameEnLabel.topAnchor.constraint(equalTo: movieNameRuLabel.bottomAnchor, constant: .movieNameEnLabelTopAnchor),
            movieNameEnLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: .movieNameEnLabelLeftRightAnchor),
            cellView.rightAnchor.constraint(equalTo: movieNameEnLabel.rightAnchor, constant: .movieNameEnLabelLeftRightAnchor),

            genresLabel.topAnchor.constraint(equalTo: movieNameEnLabel.bottomAnchor, constant: .genresLabelTopAnchor),
            genresLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: .genresLabelLeftRightAnchor),
            cellView.rightAnchor.constraint(equalTo: genresLabel.rightAnchor, constant: .genresLabelLeftRightAnchor),

            cellView.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: .ratingLabelBottomLeftAnchor),
            ratingLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: .ratingLabelBottomLeftAnchor),
            ratingLabel.widthAnchor.constraint(equalToConstant: .ratingLabelWidthAnchor),

            cellView.rightAnchor.constraint(equalTo: movieLengthLabel.rightAnchor, constant: .movieLengthLabelRightBottomAnchor),
            cellView.bottomAnchor.constraint(equalTo: movieLengthLabel.bottomAnchor, constant: .movieLengthLabelRightBottomAnchor),
            movieLengthLabel.widthAnchor.constraint(equalToConstant: .movieLengthLabelWidthAnchor),

            ratingVoteCountLabel.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor, constant: .ratingVoteCountLabelLeftAnchor),
            cellView.bottomAnchor.constraint(equalTo: ratingVoteCountLabel.bottomAnchor, constant: .ratingVoteCountLabelBottomAnchor),

            movieYearLabel.topAnchor.constraint(equalTo: movieNameRuLabel.bottomAnchor, constant: .movieYearLabelTopAnchor),
            movieYearLabel.leftAnchor.constraint(equalTo: movieNameEnLabel.rightAnchor, constant: .movieYearLabelLeftAnchor),

            movieLengthLabel.leftAnchor.constraint(equalTo: countriesLabel.rightAnchor, constant: .movieLengthLabelLeftAnchor),
            countriesLabel.leftAnchor.constraint(equalTo: ratingVoteCountLabel.rightAnchor, constant: .countriesLabelLeftAnchor),
            cellView.bottomAnchor.constraint(equalTo: countriesLabel.bottomAnchor, constant: .countriesLabelBottomAnchor)
        ])
    }
}