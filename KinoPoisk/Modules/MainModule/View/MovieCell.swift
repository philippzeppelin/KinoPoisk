//
//  MovieCell.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 30.04.2023.
//

import UIKit

final class MovieCell: UITableViewCell {
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
        cellConfigure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum Content {
    case image(UIImage)
    case imageURL(URL)
}

extension MovieCell {
    enum Content {
        case image(UIImage)
        case imageURL(URL)
    }

    struct Configuration {
        let movieNameRu: String
        let movieNameEn: String
        let rating: String
        let movieLength: String
        let ratingVoteCount: String
        let posterImageView: Content?
        let countries: String
        let genres: String
    }

    func configure(_ configuration: Configuration) {
        movieNameRuLabel.text = configuration.movieNameRu
        movieNameEnLabel.text = configuration.movieNameEn
        ratingLabel.text = configuration.rating
        movieLengthLabel.text = configuration.movieLength
        ratingVoteCountLabel.text = configuration.ratingVoteCount
        genresLabel.text = configuration.genres
        countriesLabel.text = configuration.countries

        if let posterImageContent = configuration.posterImageView {
            switch posterImageContent {
            case .image(let image):
                posterImageView.image = image
            case .imageURL(let url):
                posterImageView.kf.setImage(with: url)
            }
        } else {
            posterImageView.image = nil
        }
    }
}

extension MovieCell {
    private func cellConfigure() {
        backgroundColor = UIColor(red: 16/255, green: 14/255, blue: 15/255, alpha: 1.0)
        selectionStyle = .none
    }
}

// MARK: - Setup UI
extension MovieCell {
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

// MARK: - MovieCell constraints
extension CGFloat {
    static var cellViewTopLeftRightAnchor: CGFloat { 8 }

    static var posterImageViewTopLeftBottomAnchor: CGFloat { 5 }
    static var posterImageViewWidth: CGFloat { 75 }

    static var movieNameRuLabelTopLeftRightAnchor: CGFloat { 10 }
    static var movieNameEnLabelTopAnchor: CGFloat { 3 }
    static var movieNameEnLabelLeftRightAnchor: CGFloat { 10 }

    static var genresLabelTopAnchor: CGFloat { 2 }
    static var genresLabelLeftRightAnchor: CGFloat { 10 }

    static var ratingLabelBottomLeftAnchor: CGFloat { 10 }
    static var ratingLabelWidthAnchor: CGFloat { 20 }

    static var movieLengthLabelRightBottomAnchor: CGFloat { 10 }
    static var movieLengthLabelWidthAnchor: CGFloat { 35 }

    static var ratingVoteCountLabelLeftAnchor: CGFloat { 3 }
    static var ratingVoteCountLabelBottomAnchor: CGFloat { 10 }

    static var movieYearLabelTopAnchor: CGFloat { 3 }
    static var movieYearLabelLeftAnchor: CGFloat { 5 }

    static var movieLengthLabelLeftAnchor: CGFloat { 5 }
    static var countriesLabelLeftAnchor: CGFloat { 5 }
    static var countriesLabelBottomAnchor: CGFloat { 10 }
}
