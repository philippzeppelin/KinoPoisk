//
//  DetailTableView.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 15.05.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    var presenter: DetailViewPresenterProtocol?

    // MARK: - UI
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let scrollStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let movieNameRuLabel: UILabel = {
        let label = UILabel()
        label.font = .arialBold25()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
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

    private let ratingVoteCountLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieYearLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let genresLabel: UILabel = {
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countriesLabel: UILabel = {
        let label = UILabel()
        label.font = .arial13()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yearAndGenreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let countryAndLengthView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle(Localization.backButtonTitle, for: .normal) // localization
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 23
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let grabView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        presenter?.setMovies()

        embedView()
        setupLayout()
        setupNavigationController()
    }

    @objc private func backButtonTapped() {
        presenter?.backButtonTapped()
    }

    private func setupNavigationController() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
}

    // MARK: - Setup UI
extension DetailViewController {
    private func embedView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackView)
        scrollView.addSubview(posterImageView)
        scrollView.addSubview(movieNameRuLabel)
        scrollView.addSubview(ratingsView)
        ratingsView.addSubview(ratingLabel)
        ratingsView.addSubview(ratingVoteCountLabel)
        scrollView.addSubview(yearAndGenreView)
        yearAndGenreView.addSubview(movieYearLabel)
        yearAndGenreView.addSubview(genresLabel)
        scrollView.addSubview(countryAndLengthView)
        countryAndLengthView.addSubview(countriesLabel)
        countryAndLengthView.addSubview(movieLengthLabel)
        scrollView.addSubview(backButton)
        scrollView.addSubview(grabView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            scrollStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            scrollStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollStackView.heightAnchor.constraint(equalToConstant: .scrollStackViewHeight),

            posterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            posterImageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: .posterImageViewHeight),

            movieNameRuLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: .movieNameRuLabelTopAnchor),
            movieNameRuLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: .movieNameRuLabelLeftRightAnchor),
            scrollView.rightAnchor.constraint(equalTo: movieNameRuLabel.rightAnchor, constant: .movieNameRuLabelLeftRightAnchor),

            ratingsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            ratingLabel.topAnchor.constraint(equalTo: movieNameRuLabel.bottomAnchor, constant: .ratingLabelTopAnchor),

            ratingLabel.leftAnchor.constraint(equalTo: ratingsView.leftAnchor),
            ratingLabel.centerYAnchor.constraint(equalTo: ratingsView.centerYAnchor),

            ratingVoteCountLabel.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor, constant: .detailRatingVoteCountLabelLeftAnchor),
            ratingVoteCountLabel.centerYAnchor.constraint(equalTo: ratingsView.centerYAnchor),
            ratingVoteCountLabel.rightAnchor.constraint(equalTo: ratingsView.rightAnchor),

            yearAndGenreView.topAnchor.constraint(equalTo: ratingsView.bottomAnchor, constant: .yearAndGenreViewTopAnchor),
            yearAndGenreView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            movieYearLabel.leftAnchor.constraint(equalTo: yearAndGenreView.leftAnchor),
            movieYearLabel.widthAnchor.constraint(equalToConstant: .movieYearLabelWidthAnchor),
            movieYearLabel.centerYAnchor.constraint(equalTo: yearAndGenreView.centerYAnchor),

            genresLabel.leftAnchor.constraint(equalTo: movieYearLabel.rightAnchor, constant: .genresLabelLeftAnchor),
            genresLabel.centerYAnchor.constraint(equalTo: yearAndGenreView.centerYAnchor),
            genresLabel.rightAnchor.constraint(equalTo: yearAndGenreView.rightAnchor),

            countryAndLengthView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            countryAndLengthView.topAnchor.constraint(equalTo: yearAndGenreView.bottomAnchor, constant: .countryAndLengthViewTopAnchor),

            countriesLabel.leftAnchor.constraint(equalTo: countryAndLengthView.leftAnchor),
            countriesLabel.centerYAnchor.constraint(equalTo: countryAndLengthView.centerYAnchor),

            movieLengthLabel.leftAnchor.constraint(equalTo: countriesLabel.rightAnchor, constant: .detailMovieLengthLabelLeftAnchor),
            movieLengthLabel.centerYAnchor.constraint(equalTo: countryAndLengthView.centerYAnchor),
            movieLengthLabel.rightAnchor.constraint(equalTo: countryAndLengthView.rightAnchor),

            backButton.topAnchor.constraint(equalTo: countryAndLengthView.bottomAnchor, constant: .backButtonTopAnchor),
            backButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: .backButtonHeightAnchor),
            backButton.widthAnchor.constraint(equalToConstant: .backButtonWidthAnchor),

            grabView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: .grabViewTopAnchor),
            grabView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            grabView.heightAnchor.constraint(equalToConstant: .grabViewHeightAnchor),
            grabView.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
}

// MARK: - Extension
extension DetailViewController: DetailViewProtocol {
    func setMovies(film: Film) {
        movieNameRuLabel.text = film.nameRu
        ratingLabel.text = film.rating
        movieLengthLabel.text = film.filmLength
        movieYearLabel.text = film.year
        ratingVoteCountLabel.text = "\(film.ratingVoteCount / 1000)K"

        guard let ratingColor = Double(film.rating) else { return }
        switch ratingColor {
        case 0..<5:  ratingLabel.textColor = .red
        case 7...10: ratingLabel.textColor = .green
        default: ratingLabel.textColor = .gray
        }

        var genres: [String] = []
        for genre in film.genres {
            genres.append(genre.genre)
        }
        genresLabel.text = genres.joined(separator: ", ")

        var countries: [String] = []
        for country in film.countries {
            countries.append(country.country)
        }
        countriesLabel.text = countries.joined(separator: ", ")

        if let url = URL(string: film.posterUrl) {
            posterImageView.kf.setImage(with: url)
        }
    }
}

extension DetailViewController {
    enum Localization {
        static let backButtonTitle: String = NSLocalizedString("Back_Button_Title", comment: "Back button title")
    }
}

// MARK: - DetailViewController
extension CGFloat {
    static var scrollStackViewHeight: CGFloat { 900 }
    static var posterImageViewHeight: CGFloat { 650 }

    static var movieNameRuLabelTopAnchor: CGFloat { 40 }
    static var movieNameRuLabelLeftRightAnchor: CGFloat { 20 }

    static var ratingLabelTopAnchor: CGFloat { 20 }
    static var detailRatingVoteCountLabelLeftAnchor: CGFloat { 8 }

    static var yearAndGenreViewTopAnchor: CGFloat { 20 }

    static var movieYearLabelWidthAnchor: CGFloat { 30 }

    static var genresLabelLeftAnchor: CGFloat { 3 }

    static var countryAndLengthViewTopAnchor: CGFloat { 22 }

    static var detailMovieLengthLabelLeftAnchor: CGFloat { 8 }

    static var backButtonTopAnchor: CGFloat { 25 }
    static var backButtonHeightAnchor: CGFloat { 48 }
    static var backButtonWidthAnchor: CGFloat { 200 }

    static var grabViewTopAnchor: CGFloat { 5 }
    static var grabViewHeightAnchor: CGFloat { 5 }
    static var grabViewWidthAnchor: CGFloat { 35 }
}
